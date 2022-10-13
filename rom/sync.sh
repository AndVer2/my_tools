#!/bin/bash

# install package..
sudo apt update -y
sudo apt install bc sudo git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc libncurses5 unzip python-is-python3 -y
# run repo..

sudo mkdir ~/bin
sudo curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
sudo chmod a+x ~/bin/repo
ln -sf ~/bin/repo /usr/bin/repo

# set configs.
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# Create dirs
cd /root
mkdir crdroid ; cd crdroid

# Init repo
repo init --depth=1 -u https://github.com/crdroidandroid/android.git -b 10.0

# Clone my local repo
git clone https://github.com/AndVer2/android_manifest_samsung_m10lte.git .repo/local_manifests

# Sync
repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
. build/envsetup.sh
lunch lineage_m10lte-eng

mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka kernel -j8
