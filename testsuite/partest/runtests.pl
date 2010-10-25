#!/usr/bin/perl

# Author: Per Östlund
#
# This script parses the makefiles in the testsuite and extracts (almost) all
# testcases. It then runs each test with the runtest.pl script, which creates a
# new directory for each test and symlinks all needed files into that directory.
# In this way it's possible to run all tests in parallel, which greatly speeds
# up testing when using more than two processor cores.
#
# Usage: Run without any arguments to run the whole testsuite, or with -f to
#        run a fast test, i.e. skipping the libraries directory.
#
# NOTE: This is not the official OpenModelica way of running the testsuite, so
#       you should run a 'make test' before committing any changes just to make
#       sure that this script doesn't miss anything.
#
# NOTE: This script has only been tested on Linux so far, and will probably not
#       work under any other platform without some modifications.
#
# TODO: MetaModelicaDev in meta is not run yet, since those tests are organized
#       a bit differently.

use strict;
use warnings;

use threads;
use threads::shared;
use Thread::Queue;
use Term::ANSIColor;
use List::Util 'shuffle';
use Cwd;
use File::Path qw(rmtree);

my $fast = 0;
my @test_list;
my $test_queue = Thread::Queue->new();
my $tests_failed :shared = 0;
my @failed_tests :shared;
my $testscript = cwd() . "/runtest.pl";

# Parse a makefile
sub read_makefile {
	my $dir = shift;

	return if $dir eq "./java"; # Skip the java tests, since they don't work.
  return if($fast == 1 and $dir eq "./libraries"); # Skip libraries if -f is given.

	open(my $in, "<", "$dir/Makefile") or die "Couldn't open $dir/Makefile: $!";

	while(<$in>) {
		if(/(\S+) -f Makefile test/) {  # Recursively parse makefiles.
			read_makefile("$dir/$1");
		}
		elsif(/^TESTFILES.*=.*$/) { # Found a list of tests, parse them.
			seek($in, -length($_), 1);
			parse_testfiles($in, $dir);
		}
	}
}	

# Parse a list of tests given in a makefile by TESTFILES.
sub parse_testfiles {
	my $in = shift;
	my $path = shift;

	while(<$in>) {
		add_tests($_, $path) unless /#.*/; # Skip lines beginning with #
		last unless /\\/; # If the line doesn't end with \, stop.
	}
}

# Extract all files beginning with .mo|.mof|.mos from a line.
sub add_tests {
	my @tests = split(/\s|=|\\/, shift);
	my $path = shift;

	@tests = grep(/\.mo|\.mof|\.mos/, @tests);
	@tests = map { $_ = "$path/$_" } @tests; 

  push @test_list, @tests;
}

# Run the tests by dequeuing them from the list of tests and calling the
# runtest.pl script.
sub run_tests {
	while(defined(my $test_full = $test_queue->dequeue_nb())) {
		(my $test_dir, my $test) = $test_full =~ /(.*)\/([^\/]*)$/;
		system("$testscript $test_full");
    if($? >> 8 == 0) { # Add the test to the list of failed tests if it failed.
      lock($tests_failed);
      $tests_failed++;
      lock(@failed_tests);
      push @failed_tests, $test_full;
    }
	}
}

# Check for the -f flag.
for(@ARGV){
  if(/-f/) {
    $fast = 1;
  }
}

# Assume that we are in a subdirectory of the testsuite, so go up one level and
# parse the makefile there.
chdir("..");
read_makefile(".");

# Reverse the list of tests, because I prefer to have mofiles and mosfiles run
# before the much slower libraries tests.
@test_list = reverse(@test_list);
foreach(@test_list) {
	$test_queue->enqueue($_);
}

# Default is two threads.
my $thread_count = 2;

# Check if we can open /proc/cpuinfo to see how many cores are available, and
# use that many threads instead.
if(open(my $in, "<", "/proc/cpuinfo")) {
	$thread_count = 0;

	while(<$in>) {
		$thread_count++ if /processor/;
	}
	print "$thread_count threads\n";
}

# Make sure that omc-diff is generated before trying to run any tests.
system("make -C difftool &> /dev/null");

# Run the tests by calling the run_tests function with multiple threads.
for(my $i = 0; $i < $thread_count; $i++) {
	threads->create(\&run_tests);
}

# Wait for the tests to finish.
foreach my $thr (threads->list()) {
	$thr->join();
}

# Print out the list of tests that failed, and a summary of how many failed.
print color 'reset';
print "\n";

if(@failed_tests) {
  print "\nFailed tests:\n";

  foreach my $failed_test (@failed_tests) {
    print "\t" . $failed_test . "\n";
  }
}

my $test_count = @test_list;
print "\n$tests_failed of $test_count failed\n";

# Clean up the temporary rtest directory, so it doesn't get overrun.
rmtree("/tmp/omc-rtest");
