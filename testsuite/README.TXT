Tips for the testsuite.
To get a correct testfile, watch out for use of tab and space, can be hard to find. If rtest fails but the single file actually translates with modeq the check the log file in the /tmp directory. 

OBS!
A test MUST have the finishing "end ..." at the same indentation level as the "model ..." otherwise there will be a warning(perl -w rtest file) for the next test that are executed.
NEVER do this:
// flcass ...
//    ...
//    end flclass ...;

Do this:
// flcass ...
//    ...
// end flclass ...;
Then perl is happy. (no warnings and errornously failed testcases).