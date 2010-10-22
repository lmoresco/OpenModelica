#!/usr/bin/perl

# Author: Per Östlund
#
# This script runs on testcase, usually given to it by the runtests.pl script.

use strict;
use warnings;
use Cwd;
use Term::ANSIColor;
use File::Path qw(rmtree);
use feature "switch";

# Get the testcase to run from the command line argument.
my $test_full = $ARGV[0];
# Extract the directory and test name.
(my $test_dir, my $test) = $test_full =~ /(.*)\/([^\/]*)$/;
# Build the full path to the temporary directory to run the test in.
my $tmp_path_full = $test_dir . "/" . $test . "_temp";

my $test_suit_path_rel = "../" x ($test_full =~ tr/\///);

# Makes a symbolic link to a file.
sub make_link {
	my $file = shift;

  # Depending on how the path is given we need to use different rules for how
  # the symlink should be created.
	given($file) {
		when (/\.\.\/([\w-]*)\//) { symlink("../" . $1, "../" . $1); }
		when (/^(\w*)\/(.*)/) 	  { symlink("../" . $1, $1); }
		when (/(.*)/)						  { symlink("../" . $1, $1); }
		default 								  { symlink("../" . $file, $file); }
	}
}

# Some tests use libraries that we need to symlink the corresponding heards for.
sub lib_to_header {
	my $lib = shift;

	given($lib) {
		when (/lib(\w*)\.\w*/) 	{ return $1 . ".h"; }
		when (/(\w*)\.lib/) 		{ return $1 . ".h"; }
		default { return ""; }
	}
}

# Some tests needs some special symlinks that are hard to determine by just
# parsing the test-scripts, so this functions applies a couple of special rules.
sub make_test_specific_links {
	given($test) {
		when ("ExtObj.mos") { make_link("testTables.txt"); }
    when ("ExtObjStringParam.mos") {
      make_link("sampledata.xml");
      make_link("ExtObjStringParam.ext.c");
      make_link("ExtObjStringParam.ext.h");
    }
		when ("ModelicaUtilities.mos") { 
			make_link("ModelicaUtilities.myExtFunction.c"); 
		}
		when ("Identifier.mos") { make_link("checkparseerror.c"); }
		when ("ExternalFunctionResultOrder.mos") {
			make_link("ext_ExternalFunctionResultOrder.c");
		}
		when ("PartialFn6.mos") { make_link("PartialFn6.ext_f.c"); };
    when ("RunScript.mos") { make_link("strings.mo"); };
	}
}

# This functions sets up a sandbox for a tests by creating a temporary directory
# and symlinking the needed files into it.
sub enter_sandbox {
	mkdir($tmp_path_full);
	chdir($tmp_path_full);
	make_link($test);
	make_test_specific_links();

  # Parse the testscript to see if it has any special requirements.
  my $open_ret = open(my $in, "<", $test);

	unless($open_ret) {#or die "Couldn't open $test: $!\n";
    print " ";
    print color 'red on_blue';
    print "[$test]";
    print color 'reset';
    exit_sandbox();
    exit 0; 
  }

	my $stop_expr;

  # If we are parsing a mos-file, stop when we reach 'Result:'. Otherwise, parse
  # until we reach a line that's not a comment.
	if(substr($test, -3) eq "mos") {
		$stop_expr = "// Result:";
	} else { 
		$stop_expr = "^[^/]";
	}

  # Check for a couple of keywords such as loadFile, and create the neccessary
  # symlinks.
	while(<$in>) {
		given($_) {
			when (/$stop_expr/) 							{ last; }
			when (/setup_command.*\s(.*\.c)/) { make_link($1); }
			when (/loadFile.*\(\"(.*)\"\)/) 	{ make_link($1); }
      when (/runScript.*\(\"(.*)\"\)/)  { make_link($1); }
			when (/system\(\"(gcc|g\+\+).*\s(\w*\.\w*)\s(\w*\.\w*)/) {
				my $header = lib_to_header($2);
				make_link($header); 
				make_link($3);
			}
			when (/system\(\"(gcc|g\+\+).*\s(\w*\.\w*)/) {
				make_link($2);
			}	
			when (/external.*\\\"(.*\.h)\\\"/){
				make_link($1);

				while(<$in>) {
					if(/end (.*);/) {
						make_link($1 . ".c");
						last;
					}
				}
			}
      when (/env:\s*OPENMODELICALIBRARY\s*=\s*(.*)/) {
        my $lib = $1;
        $lib =~ s/((?:\.\.\/)+)/..\/$1/g;
        $ENV{'OPENMODELICALIBRARY'} = $lib;
      }
		}
	}
}

# Exit the sandbox by going up one directory level and delete the temporary
# directory.
sub exit_sandbox {
	chdir("..");
  rmtree($test . "_temp") unless $test eq "RunScript.mos";
}


$ENV{'PATH'} = "./:" . $ENV{'PATH'};

enter_sandbox();

# Clean up fail logs from previous runs.
unlink("../$test.fail_log");

# Determine the full path to rtest.
my $rtest = $test_suit_path_rel . "rtest -v -nolib ";
# If we're in meta, append the MetaModelica flag to rtest.
$rtest = $rtest . " +g=MetaModelica " if $test_dir eq "./meta";

# Run the testscript and redirect output to a logfile.
system("$rtest $test &> $test.test_log");

# Read the logfile and see if the test succeeded or failed.
open(my $test_log, "<", "$test.test_log") or die "Couldn't open test log $test.log: $!\n";

my $exit_status = 1;
my $erroneous = 0;

while(<$test_log>) {
	if(/... erroneous/) {
		$erroneous = 1;
	}
	if(/== (\d) out of 1 tests failed.*time: (\d*)/) {
		my $time = $2;
		if($1 =~ /0/) {
			print color 'green';
		} else {
			if($erroneous == 0) {
        system("cp $test.test_log ../$test.fail_log");
				print color 'red';
				$exit_status = 0;
			} else {
				print color 'magenta';
			}
		}
		print " [$test:$time]";
    print color 'reset';
	}
}

exit_sandbox();
exit $exit_status;
