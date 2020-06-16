#!/usr/bin/env bash

# set paths
coolP="/groups/gerlich/experiments/Experiments_004800/004812/Sequencing_data/Pooled_FC_1_2_3_4/cooler/"
logDir="/groups/gerlich/experiments/Experiments_004800/004812/clusterlog/"

jobName="Zoomify_balance_cis_and_trans"
logFile="$logDir${jobName}.log"
tempScript="cooler zoomify ${coolP}G2.fc_1_2_3_4.wOldG2.cis_and_trans.1000.cool -n 22 \
                             -r 1000,2000,4000,5000,6000,8000,10000,20000,30000,40000,50000,100000,120000,150000,160000,180000,200000,500000,1000000,5000000 --balance\
                            --balance-args '--ignore-diags 1 --mad-max 5 --max-iters 500'"
echo $tempScript
sbatch -c 24 --mem 40G --partition=m --qos=short --job-name $jobName --output $logFile --wrap="$tempScript"