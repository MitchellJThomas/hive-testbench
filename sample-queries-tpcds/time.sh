while [[ $# -gt 0 ]]; do
  case "$1" in
    --db)
      shift
      DB=$1
      shift
      ;;
    --dir)
      shift
      OUTPUT_DIR=$1
      shift
      ;;
  esac
done

RUN_FILE=`mktemp`
echo "Temp RUN_FILE: ${RUN_FILE}"

RECORD_FILE=`mktemp`

echo "!record ${RECORD_FILE}" > ${RUN_FILE}
cat perf_run.sql >> ${RUN_FILE}
echo "Temp Recording Output: ${RECORD_FILE}"

hive --showHeaders=false --silent=true --outputformat=dsv  --hivevar DB=${DB} -f ${RUN_FILE}

grep "\-\-marker\-\-" ${RECORD_FILE} > ${OUTPUT_DIR}/${DB}.marker.dsv
