#!/bin/bash
SPS=100
FFT_SIZE=4096
DATAFILE="overnight.ppg.gz"
JAVA="java -cp ../../scripts"
FFT="../../scripts/fft"

gunzip -c ${DATAFILE} | ${JAVA} FilterChannel 0 |  tail -n +100000 | ${JAVA} Clean | cut -d ' ' -f 1,6,7 | ${FFT} ${FFT_SIZE} ${SPS} > t.matrix
gnuplot plot_waterfall.gnuplot


