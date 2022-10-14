#!/bin/bash

sudo apt update
sudo apt install rsync -y

cd crdroid

. build/envsetup.sh
lunch lineage_m10lte-eng

mka libLLVMCore
mka bootimage
mka vendorimage
mka recoveryimage
