#!/usr/bin/env bash

seqDir="/groups/gerlich/experiments/Experiments_004800/004812/Sequencing_data/Pooled_FC_1_2_3_4/cooler/"
logDir="/groups/gerlich/experiments/Experiments_004800/004812/clusterlog/"

jobName="Merge_cis_trans_cool_exp4812"
logFile="$logDir${jobName}.log"
files[0]="${seqDir}G2.fc_1_2_3_4.wOldG2.cis.1000.cool"
files[1]="${seqDir}G2.fc_1_2_3_4.wOldG2.trans.1000.cool"
tempScript="cooler merge ${seqDir}G2.fc_1_2_3_4.wOldG2.cis_and_trans.1000.cool ${files[@]}"
echo $tempScript
sbatch -c 1 --mem 20G --qos=short --job-name $jobName --output $logFile --wrap="$tempScript"

