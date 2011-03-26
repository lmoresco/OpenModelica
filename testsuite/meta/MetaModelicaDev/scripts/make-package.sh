#!/bin/bash

DIR=/tmp/make-package-sh-$$/

cp ../../../../Compiler/Template/Tpl.mo ../10_pamtrans/

mkdir -p $DIR

svn export .. $DIR/MetaModelica
(cd ../documentation/; for f in *.ppt; do
  echo $f
  rm "$DIR/MetaModelica/documentation/$f"
  cp "../documentation/`echo $f | sed 's/ppt$/pdf/'`" $DIR/MetaModelica/documentation/
done)

find $DIR -name SOLUTION*.mo* -delete

FILE=MetaModelicaDevelopersCourse-`date +%Y-%m-%d`.tar.gz
(cd $DIR; tar czf $FILE ./MetaModelica)
cp $DIR/$FILE ./

rm -rf $DIR
