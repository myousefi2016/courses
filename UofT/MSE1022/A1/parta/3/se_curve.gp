# gnuplot script for generating stress-strain curve
set term postscript enhanced
set output 'se_curve.eps'
set xlabel 'Strain'
set ylabel 'Stress (MPa)'
set grid 
erate1=0.00001
erate2=0.000005
erate3=0.000001
f1(x)=E1*x
f2(x)=E2*x
f3(x)=E3*x
#
set style line 1 lt 1 lw 1 pt 3 linecolor rgb "red"
set style line 2 lt 1 lw 1 pt 3 linecolor rgb "green"
set style line 3 lt 1 lw 1 pt 3 linecolor rgb "blue"
#

fit f1(x) '< head -50 run_100.txt' u ($1*erate1):(-$7/10) via E1
fit f2(x) '< head -50 run_200.txt' u ($1*erate1):(-$7/10) via E2
fit f3(x) '< head -50 run_300.txt' u ($1*erate1):(-$7/10)  via E3

plot '< head -100 run_100.txt' u ($1*erate1):(-$7/10) title 'Strain Rate 100K' w l ls 1,f1(x) title 'Linear Fit 100K' ls 1,'< head -100 run_200.txt' u ($1*erate1):(-$7/10) title 'Strain Rate 200K' w l ls 2,f2(x) title 'Linear Fit 200K' ls 2,'< head -100 run_300.txt' u ($1*erate1):(-$7/10) title 'Strain Rate 300K' w l ls 3,f3(x) title 'Linear Fit 300' ls 3

#plot '< head -80 run_100.txt' u ($1*erate1):(-$7/10) title 'Strain Rate 100K' w l ls 1,'< head -80 run_200.txt' u ($1*erate1):(-$7/10) title 'Strain Rate 200K' w l ls 2,'< head -80 run_300.txt' u ($1*erate1):(-$7/10) title 'Strain Rate 300K' w l ls 3
