#!/bin/bash
#wc=`perl wordCount/texcount.pl -sum -merge -q -0 thesis.tex`
wc=`texcount thesis.tex -sum -merge -0`

echo $wc | grep '[0-9]*'
wc=`$wc | tr -d '(error:38)' '          '`
sed -i 's|\(.*\)||' log
wc=`cat log`

#wc=`python doWordCount.py`
#wc=`texcount thesis.tex -sum -merge -0`

echo "Number of words = "$wc
t=`date +%s`
printf "%u %u\n" "${t}" "${wc}" >> wordCountHistory
root makeWordCountPlot.C -b -q -l
