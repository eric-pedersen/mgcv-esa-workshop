#!/bin/sh

# correct the paths to the mathjax files for HTML versions of the slides

# changes the link to be to a folder called mathjax-23 in the current directory
# this avoids having lots of copes of the same mathjax stuff

# also use decktape to make a PDF of the slides (probably only works on
# Dave's laptop)

for i in $( ls *.html); do
  echo processing: $i
  FN=${i/.html/}_files\\/
  sed "s/$FN//" "$i" > tmp.html
  mv tmp.html $i
  PDFFN=${i/.html/}.pdf
  ~/sources/decktape/bin/phantomjs ~/sources/decktape/decktape.js automatic -s 1024x768 $i $PDFFN
done
