#!/usr/bin/perl

# Author: Per Östlund
#
# This script runs a testcase, usually given to it by the runtests.pl script.

use strict;
use warnings;
use Cwd;
use Term::ANSIColor;
use File::Path qw(rmtree);
use feature "switch";

# Get the testcase to run from the command line argument.
my $test_full = $ARGV[0];
my $no_colour = 0;
my $withxml = 0;

for(@ARGV){
  if(/--no-colour/) {
    $no_colour = 1;
  }
  elsif(/-with-xml/) {
    $withxml = 1;
  }
}

# Extract the directory and test name.
(my $test_dir, my $test) = $test_full =~ /(.*)\/([^\/]*)$/;
# Add a random number to the temporary directory, to avoid problems with rtest
# when we have two test cases with the same name in different directories.
my $test_id = int(rand(9999));
# Build the full path to the temporary directory to run the test in.
my $tmp_path_full = $test_dir . "/" . $test . "_temp" . $test_id;

# Makes a symbolic link to a file.
sub make_link {
  my $file = shift;

  # Depending on how the path is given we need to use different rules for how
  # the symlink should be created.
  given($file) {
    when (/\.\/(\w*)\/package.mo/)    { symlink("../" . $1, $1); }
    when (/\.\.\/([\w-]*)\//) { symlink("../" . $1, "../" . $1); }
    when (/^(\w*)\/(.*)/)     { symlink("../" . $1, $1); }
    when (/(.*)/)             { symlink("../" . $1, $1); }
    default                   { symlink("../" . $file, $file); }
  }
}

# Some tests use libraries that we need to symlink the corresponding headers for.
sub lib_to_header {
  my $lib = shift;

  given($lib) {
    when (/lib(\w*)\.\w*/)  { return $1 . ".h"; }
    when (/(\w*)\.lib/)     { return $1 . ".h"; }
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
    when ("ExternalLibraryFunction.mos") {
      make_link("TestLibrary");
    }
    when ("TestLoadModel.mos") {
      make_link("TestLibrary");
    }
    when ("PartialFn6.mo") { make_link("PartialFn6.ext_f.c"); };
    when ("RunScript.mos") { make_link("strings.mo"); };
    when ("SusanTest.mos") { 
      make_link("SusanTestSmall.tpl");
      make_link("SusanTestTV.mo");
    };
    when ("ParseModel.mos") {
      make_link("ParseModel-saved.mo");
    }
    when ("EventTests.mos") {
      make_link("EventTests.mat");
    }
  }

  given($test_dir) {
    when ("./libraries/msl31/simulate") {
      (my $test_name) = $test =~ /(.*)\.mos$/;
      make_link("$test_name.mat");
    }
  }
}

sub remove_test_specific_links {
  given($test) {
    when ("ParseModel.mos") {
      unlink("ParseModel.mo");
    }
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
    if ($no_colour) {
      print "[$test] FAILED\n";
    } else {
      print color 'red on_blue';
      print "[$test]";
      print color 'reset';
    }
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
      when (/$stop_expr/)               { last; }
      when (/setup_command.*\s(.*\.c)/) { make_link($1); }
      when (/loadFile.*\(\"linear_simple_test\.mo\"\)/) {}
      when (/loadFile.*\(\"(.*)\"\)/)   { make_link($1); }
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

  remove_test_specific_links();
}

# Exit the sandbox by going up one directory level and delete the temporary
# directory.
sub exit_sandbox {
  chdir("..");

  # Hack to get RunScript working.
  sleep 1 if $test eq "RunScript.mos";

  rmtree($test . "_temp" . $test_id);
}

sub needs_sandbox {
  given($test) {
    when ("CheckSourcesForTabs.mos") { return 0; }
    when ("testCompileInteractive.mos") { return 0; }
    default { return 1; }
  }
}

$ENV{'PATH'} = "./:" . $ENV{'PATH'};

# Some tests are hard to sandbox and don't really need to be, so skip sandboxing
# for those tests.
my $sandbox_needed = needs_sandbox();

enter_sandbox() if $sandbox_needed;
chdir("../" . $test_dir) if !$sandbox_needed;

my $fail_log = ($sandbox_needed ? "../" : "") . "$test.fail_log";

# Clean up fail logs from previous runs.
unlink("$fail_log");

# Determine the full path to rtest.
my $test_suit_path_rel = "../" x (($sandbox_needed ? 0 : -1) + ($test_full =~ tr/\///));

my $rtest = $test_suit_path_rel . "rtest -v -nolib ";

# If we're in meta, append the MetaModelica flag to rtest.
$rtest = $rtest . " +g=MetaModelica " if $test_dir eq "./meta";

# Run the testscript and redirect output to a logfile.
system("$rtest $test > $test.test_log 2>&1");

# Read the logfile and see if the test succeeded or failed.
open(my $test_log, "<", "$test.test_log") or die "Couldn't open test log $test.log: $!\n";

my $exit_status = 1;
my $erroneous = 0;
my $time = 0;
my $success = 1;

while(<$test_log>) {
  if(/\.\.\. erroneous/) {
    $erroneous = 1;
  }
  elsif(/== (\d) out of 1 tests failed.*time: (\d*)/) {
    $success = $1;
    $time = $2;
  }
}

if (!$no_colour) {
  if($success =~ /0/) {
    print color 'green';
  } else {
    if($erroneous == 0) {
      system("cp $test.test_log $fail_log");
      print color 'red';
      $exit_status = 0;
    } else {
      system("cp $test.test_log $fail_log");
      print color 'magenta';
    }
  }
  print " ";
}
print "[$test:$time]";
if ($no_colour) {
  if($1 =~ /0/) {
    print " OK\n";
  } else {
    if($erroneous == 0) {
      system("cp $test.test_log $fail_log");
      print " Failed\n";
      $exit_status = 0;
    } else {
      system("cp $test.test_log $fail_log");
      print " Erroneous\n";
    }
  }
} else {
  print color 'reset';
}

if ($withxml) {
  eval { require XML::Entities; 1; };

  if(!$@) {
    XML::Entities->import();
  } else {
    print "Error: Could not load XML::Entities module.\n";
    exit 1;
  }

  my $xml_log = ($sandbox_needed ? "../" : "") . "$test.result.xml";
  my $XMLOUT;
  open $XMLOUT, '>', $xml_log or die "Couldn't open result.xml: $!";
  binmode $XMLOUT;
  my $classname = $test_dir;
  # Replace ./abc/def with abc.def
  $classname =~ s,\./,,g;
  $classname =~ s,/,.,g;
      
  print $XMLOUT "<testcase classname=\"$classname\" name=\"$test\" time=\"$time\">";
  if ($erroneous == 1) {
    print $XMLOUT '<skipped />';
  }
  elsif ($exit_status == 0) {
    print $XMLOUT '<failure type="Failure">Output mismatch (see stdout for details)</failure>';
    print $XMLOUT '<system-out>';
    open my $fh, '<', $fail_log;
    my $data;
    if (!$fh) {
      $data = 'Unknown result';
    } else {
      $data = do { local $/; <$fh> };
      $data = XML::Entities::numify('all', $data);
    }
    print $XMLOUT $data;
    print $XMLOUT '</system-out>';
  }
  print $XMLOUT "</testcase>\n";
  close $XMLOUT;
}

exit_sandbox() if $sandbox_needed;

if ($exit_status == 0) {
  exit 0;
} else {
  if ($time < 1) {
    exit 1;
  } elsif ($time > 100) {
    exit 100;
  }
  exit $time;
}

