#!/usr/bin/perl
use Cwd 'abs_path';

$inf = $ARGV[0];
$outf = $ARGV[1];
open(INP, "<$inf")  or die("Cannot open file '$inf' for reading\n");
open(OUTP, ">$outf") or die("Cannot open file '$outf' for writing\n");

$lnum = 1;
$inStmt = 0;
$inStmtFile = "";
$inStmtLine = 0;
while( $line = <INP> ){
  if ($line =~ /^ *..#modelicaLine .([A-Za-z.\/]*):([0-9]*):[0-9]*-[0-9]*:[0-9]*...$/) {
    $inStmtFile = abs_path($1);
    $inStmtLine = $2;
    $inStmt = 1;
  } elsif ($line =~ /^ *..#endModelicaLine/) {
    $inStmt = 0;
  } elsif ($inStmt) {
    print OUTP "#line $inStmtLine \"$inStmtFile\"\n$line";
  } else {
    print OUTP "#line $lnum \"$inf\"\n$line";
  }
  $lnum++;
}

close INP;
close OUTP;
