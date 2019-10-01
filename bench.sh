#!/bin/sh

PROGRAM=$1
START=$2
END=$3
STEP=$4

for ((VAL=$START; $VAL <= $END; VAL=($VAL + $STEP)))
do
    VALUES="${VAL}"
    for CORES in 1 2 4 8
    do
        START_TIME=$(date +%s.$N)
        { ./"$PROGRAM" $VAL $CORES & } &> /dev/null
        PID=$!
        wait $PID
        END_TIME=$(date +%s.%N)
        DIFF=$(echo "$END_TIME - $START_TIME" | bc)
        VALUES+=" ${DIFF}"
    done
    for n in "$VALUES"
    do
        printf "%-20s" $n
    done
    printf "\n"
    VALUES=""
done

