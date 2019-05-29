set terminal svg size 1600 1200 dynamic font "Sans,10"
set output 'network-speed.svg'

set multiplot layout 4, 1 title "Internet speed"

set datafile separator ","
set xlabel 'Time'
set timefmt '%Y-%m-%dT%H:%M:%S'
set xdata time
# set format x '%Y%m%dT%H%M%S'
set xtics rotate by 45 offset 0,graph -0.2
set ylabel 'Speed [Mbit/s]'
set yrange [0:]

array titles[4] = [ 'Orange LTE', 'Play LTE', 'T-Mobile LTE', 'JMDI GPON' ]
array datafiles[4] = [ 'example-data/lte-orange.csv', 'example-data/lte-play.csv', 'example-data/lte-tmobile.csv', 'example-data/jmdi.csv' ]

do for [i=1:|titles|] {
   set title titles[i]
   plot datafiles[i] using 4:($7/(1e6)) smooth csplines with lines title "Download", datafiles[i] using 4:($8/(1e6)) with lines title "Upload"
}

unset multiplot
