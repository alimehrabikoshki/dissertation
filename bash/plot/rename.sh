#!/bin/bash
#Needed only once
cd /mnt/c/Users/Ali/PycharmProjects/dissertation/results/results/raw/interregion  || exit
for filename in *800K_400*; do  mv $filename ${filename//800K_400/200K_500}; done
for filename in *400K_200*; do  mv $filename ${filename//400K_200/100K_250}; done
cd /mnt/c/Users/Ali/PycharmProjects/dissertation/results/results/raw/interzone || exit
for filename in *800K_400*; do  mv $filename ${filename//800K_400/200K_500}; done
for filename in *400K_200*; do  mv $filename ${filename//400K_200/100K_250}; done
cd /mnt/c/Users/Ali/PycharmProjects/dissertation/results/results/raw/intrazone || exit
for filename in *800K_400*; do  mv $filename ${filename//800K_400/200K_500}; done
for filename in *400K_200*; do  mv $filename ${filename//400K_200/100K_250}; done