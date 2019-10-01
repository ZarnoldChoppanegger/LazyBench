#!/bin/bash
FILE=$1
YMIN=$2
YMAX=$3

gnuplot -persist <<-EOFMarker
    set yrange [$YMIN:$YMAX]
    set xlabel 'Input'
    set ylabel 'Time [sec]'
    plot "$FILE" using 1:2 title "1 core" with lines, "$FILE" using 1:3 title "2 cores" with lines, "$FILE" using 1:4 title "4 cores" with lines, "$FILE" using 1:5 title "8 cores" with lines
EOFMarker
