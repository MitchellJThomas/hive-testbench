#!/bin/bash

# Build dataset and supply tables first.
. ./tpcds-gen.sh $@

echo -e "Running setup for: Managed Partitioned, ORC"
echo "Output going to: /tmp/mngd_part_orc.log"
nohup ./tpcds-setup.sh $@ > /tmp/mngd_part_orc.log 2>&1 &

echo -e "Running setup for: Managed Non-Partitioned, ORC"
echo "Output going to: /tmp/mngd_no-part_orc.log"
nohup ./tpcds-setup.sh $@ --no-part > /tmp/mngd_no-part_orc.log 2>&1 &

echo -e "Running setup for: External Partitioned, ORC"
echo "Output going to: /tmp/ext_part_orc.log"
nohup ./tpcds-setup.sh $@ --external > /tmp/ext_part_orc.log 2>&1 &

echo -e "Running setup for: External Non-Partitioned, ORC"
echo "Output going to: /tmp/ext_no-part_orc.log"
nohup ./tpcds-setup.sh $@ --no_part --external > /tmp/ext_no-part_orc.log 2>&1 &
