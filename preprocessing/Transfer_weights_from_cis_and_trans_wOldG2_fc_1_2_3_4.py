"""Script used to transfer balancing weigths from
G2.cis_and_trans.1000.mcool to the cis and trans G2 samples"""

import h5py
import os

# define functions


def transferWeights(source, target, binsize):
    # get weights from source
    with h5py.File(source, 'r') as f:
        weights = f["resolutions"][binsize]["bins"]["weight"]
        weightArray = weights[:]
    # write weights into target
    with h5py.File(target, 'r+') as f:
        try:
            targetWeights = f["resolutions"][binsize]["bins"]["weight"]
            targetWeights[...] = weightArray
        except KeyError:
            f["resolutions"][binsize]["bins"]["weight"] = weightArray


# set working directory

os.chdir("/groups/gerlich/experiments/Experiments_004800/004812/Sequencing_data/Pooled_FC_1_2_3_4/cooler/")


# transfer weights for cis and transds

targetDir = "/groups/gerlich/experiments/Experiments_004800/004812/Sequencing_data/Pooled_FC_1_2_3_4/cooler/"


# get different bins
bins = "1000,2000,4000,5000,6000,8000,10000,20000,30000,40000,50000,100000,120000,150000,160000,180000,200000,500000,1000000,5000000".split(",")
# transfer weights trans
source = 'G2.fc_1_2_3_4.wOldG2.cis_and_trans.1000.mcool'
target = f'{targetDir}G2.fc_1_2_3_4.wOldG2.trans.1000.mcool'
for binSize in bins:
    transferWeights(source, target, binSize)
# transfer weights cis
target = f'{targetDir}G2.fc_1_2_3_4.wOldG2.cis.1000.mcool'
for binSize in bins:
    transferWeights(source, target, binSize)
