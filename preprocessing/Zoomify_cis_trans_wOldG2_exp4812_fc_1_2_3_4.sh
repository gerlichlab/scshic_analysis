#!/usr/bin/env bash

# set paths
coolP="/groups/gerlich/experiments/Experiments_004800/004812/Sequencing_data/Pooled_FC_1_2_3_4/cooler/"
logDir="/groups/gerlich/experiments/Experiments_004800/004812/clusterlog/"

ctypes="cis trans"


for ctype in $ctypes; do
    jobName="Zoomify_${ctype}_${barcode}"
    logFile="$logDir${jobName}.log"
    tempScript="cooler zoomify ${coolP}G2.fc_1_2_3_4.wOldG2.${ctype}.1000.cool -n 1 \
                                -r 1000,2000,4000,5000,6000,8000,10000,20000,30000,40000,50000,100000,120000,150000,160000,180000,200000,500000,1000000,5000000"
    echo $tempScript
    sbatch -c 2 --mem 15G --qos=short --job-name $jobName --output $logFile --wrap="$tempScript"
done
