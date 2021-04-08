#!/bin/bash

# Build dataset and supply tables first.
. ./tpcds-gen.sh $@

echo -e "Running setup for: Managed Partitioned, ORC"
unset NOT_PARTITIONED
unset LEGACY
echo "Output going to: /tmp/mngd_part_orc.log"
nohup ./tpcds-setup.sh $@ > /tmp/mngd_part_orc.log 2>&1 &

echo -e "Running setup for: Managed Non-Partitioned, ORC"
set NOT_PARTITIONED=true
unset LEGACY
echo "Output going to: /tmp/mngd_no-part_orc.log"
nohup ./tpcds-setup.sh $@ > /tmp/mngd_no-part_orc.log 2>&1 &

echo -e "Running setup for: External Partitioned, ORC"
unset NOT_PARTITIONED
set LEGACY=true
echo "Output going to: /tmp/ext_part_orc.log"
nohup ./tpcds-setup.sh $@ > /tmp/ext_part_orc.log 2>&1 &

echo -e "Running setup for: External Non-Partitioned, ORC"
set NOT_PARTITIONED=true
set LEGACY=true
echo "Output going to: /tmp/ext_no-part_orc.log"
nohup ./tpcds-setup.sh $@ > /tmp/ext_no-part_orc.log 2>&1 &
