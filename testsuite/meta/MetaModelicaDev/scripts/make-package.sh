#!/bin/bash

DIR=/tmp/make-package-sh-$$/

mkdir -p $DIR

svn export .. $DIR/MetaModelica
(cd ../documentation/; for f in *.ppt; do
  rm -f $DIR/MetaModelica/documentation/$f
  cp "../documentation/`echo $f | sed 's/ppt$/pdf/'`" $DIR/MetaModelica/documentation/
done)

find $DIR -name SOLUTION*.mo* -delete

FILE=MetaModelicaDevelopersCourse-`date +%Y-%M-%d`.tar.gz
(cd $DIR; tar czf $FILE ./MetaModelica)
cp $DIR/$FILE ./

rm -rf $DIR
