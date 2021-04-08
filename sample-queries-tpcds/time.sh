hive --showHeaders=false --silent=true --outputformat=dsv  --hivevar DB=$1 --hivevar OUTPUT_FILE=$2 -f perf_run.sql



