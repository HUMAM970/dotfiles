#!/usr/bin/env fish

set tmpfile (mktemp)
yazi --chooser-file $tmpfile
set selected (cat $tmpfile)
rm $tmpfile
echo $selected
