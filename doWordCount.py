import subprocess as sub

wc = sub.check_output("perl wordCount/texcount.pl -sum -merge -q -0 thesis.tex",shell=True)
print wc.split()[0]

