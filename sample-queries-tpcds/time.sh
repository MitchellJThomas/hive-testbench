while [[ $# -gt 0 ]]; do
  case "$1" in
    --db)
      shift
      DB=$1
      shift
      ;;
    --output)
      shift
      OUTPUT=$1
      shift
      ;;
  esac
done

RUN_FILE=`mktemp`
echo "Temp RUN_FILE: ${RUN_FILE}"

echo "!record ${OUTPUT};" > ${RUN_FILE}
cat perf_run.sql >> ${RUN_FILE}

hive --showHeaders=false --silent=true --outputformat=dsv  --hivevar DB=${DB} -f ${RUN_FILE}



