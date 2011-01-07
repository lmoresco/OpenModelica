#!/bin/sh
# Refactor matchcontinue to match
# Enable all debug output, but disable dead code elimination of matchcontinue expressions in the middle of the cases
sed s/+d=/+d=patternmAllInfo,patternmSkipMCDCE,patternmSkipFilterUnusedAsBindings,patternmSkipMoveLastExp,/ MainTest.mos > MainTestAllInfo.mos
OK=0
FAILED=0
omc MainTestAllInfo.mos > log
for l in `grep "Notification: This matchcontinue expression has no overlapping patterns and should be using match instead of matchcontinue." log | sed "s/ .*//"`; do
  FILE=`echo $l | cut -d: -f1 | cut -d[ -f2`
  STARTL=`echo $l | cut -d: -f2`
  STARTC=`echo $l | cut -d: -f3 | cut -d- -f1`
  ENDL=`echo $l | cut -d: -f3 | cut -d- -f2`
  ENDC=`echo $l | cut -d: -f4`
  if grep -n ^ $FILE | egrep "^$STARTL:|^$(($STARTL+1)):" | grep -q ":= matchcontinue" && \
     grep -n ^ $FILE | grep ^$ENDL: | grep -q "end matchcontinue"; then
    if grep -n ^ $FILE | grep ^$STARTL: | grep -q ":= matchcontinue"; then
      sed -i "$STARTL s/:= matchcontinue/:= match/" $FILE
    else
      sed -i "$(($STARTL+1)) s/:= matchcontinue/:= match/" $FILE
    fi
    sed -i "$ENDL s/end matchcontinue/end match/" $FILE
    echo $FILE $STARTL $STARTC $ENDL $ENDC OK
    OK=$(($OK+1))
  else
    if grep -n ^ $FILE | grep ^$STARTL: | grep -q ":= *\$" && grep -n ^ $FILE | grep ^$(($STARTL+1)): | grep -q "matchcontinue"; then
    # One line has :=, second starts with matchcontinue
      sed -i "$(($STARTL+1)) s/ matchcontinue/ match/" $FILE
      sed -i "$ENDL s/end matchcontinue/end match/" $FILE
      echo $FILE $STARTL $STARTC $ENDL $ENDC OK
      OK=$(($OK+1))
    else
      echo $FILE $STARTL $STARTC $ENDL $ENDC failed
      FAILED=$(($FAILED+1))
    fi
  fi
done
UOK=0
UFAILED=0
for l in `grep "Notification: Unused local variable: " log | sed "s/ .*: //" | sort -nr -t: --key=2`; do
  FILE=`echo $l | cut -d: -f1 | cut -d[ -f2`
  STARTL=`echo $l | cut -d: -f2`
  STARTC=`echo $l | cut -d: -f3 | cut -d- -f1`
  ENDL=`echo $l | cut -d: -f3 | cut -d- -f2`
  ENDC=`echo $l | cut -d: -f4`
  VAR=`echo $l | cut -d] -f2 | cut -d. -f1`
  CNT=0
  THISOK=0
  if [ "$STARTL" -eq "$ENDL" ] ; then
  LINE=`grep -n ^ "$FILE" | grep "^$STARTL:" | cut -d: -f2`
  else
  LINE=""
  fi
  echo "$LINE"
  # Used until we had removed ~8000 declarations so it was easier to see if something was done wrong...
  #if echo "$LINE" | egrep -q "/|input|output|local|{|:" ; then
  #  UFAILED=$((UFAILED+1))
  #  THISOK=0
  if echo "$LINE" | grep -q " $VAR," ; then
    sed -i "$STARTL s/ $VAR,/ /" "$FILE"
    THISOK=1
    UOK=$((UOK+1))
  elif echo "$LINE" | grep -q ", *$VAR," ; then
    sed -i "$STARTL s/, *$VAR,/,/" "$FILE"
    THISOK=2
    UOK=$((UOK+1))
  elif echo "$LINE" | grep -q ",$VAR," ; then
    sed -i "$STARTL s/,$VAR,/,/" "$FILE"
    THISOK=3
    UOK=$((UOK+1))
  elif echo "$LINE" | grep -q ", *$VAR;" ; then
    sed -i "$STARTL s/, *$VAR;/;/" "$FILE"
    THISOK=4
    UOK=$((UOK+1))
  elif echo "$LINE" | grep -q ",$VAR;" ; then
    sed -i "$STARTL s/,$VAR;/;/" "$FILE"
    THISOK=5
    UOK=$((UOK+1))
  elif echo "$LINE" | grep -E -q "^[ 	]*([A-Za-z_.<>0-9]|, ?)* *$VAR *(\"[A-Za-z0-9 ,.'\-]*\")* *; *\$" ; then
    sed -i "$STARTL"d "$FILE"
    THISOK=6
    UOK=$((UOK+1))
  else
    UFAILED=$((UFAILED+1))
    THISOK=0
  fi
  if [ "$THISOK" != "0" ] ; then
    echo $FILE $STARTL $STARTC $ENDL $ENDC unused $VAR OK "($THISOK)"
  else
    echo $FILE $STARTL $STARTC $ENDL $ENDC unused $VAR failed
  fi
done
echo Removing overlapping matchcontinue expression: $OK OK, $FAILED FAILED
echo Removing unused local declarations: $UOK OK, $UFAILED FAILED
