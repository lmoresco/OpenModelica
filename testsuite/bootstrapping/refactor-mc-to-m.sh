#!/bin/sh
# Refactor matchcontinue to match
sed s/+d=/+d=patternmAllInfo,/ MainTest.mos > MainTestAllInfo.mos
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
echo OK: $OK
echo FAILED: $FAILED
