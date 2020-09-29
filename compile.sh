#!/bin/bash

mount_host_data

(echo 'test'; echo 'test') | passwd

echo 'RUN IN VM! -> startInVM --arch=power9 --time="08:00:00"'

tmpDir="$( mktemp -d --tmpdir=/host_data/tmp )" && tmpImg="$tmpDir/singularity-build-temp-dir"
truncate -s 25G "$tmpImg.ext4" && echo j | mkfs.ext4 "$tmpImg.ext4"
mkdir -p "$tmpImg" && i=1 && while test -e "/dev/loop$i"; do (( ++i )); done && mknod -m 0660 "/dev/loop$i" b 7 "$i"
mount -o loop="/dev/loop$i" "$tmpImg"{.ext4,}

export SINGULARITY_TMPDIR="$tmpImg"

export SINGULARITY_CACHEDIR=/scratch/ws/0/s3811141-singularity_test/cache/

mkdir -p $SINGULARITY_CACHEDIR

singularity build image.sif recipe.txt
