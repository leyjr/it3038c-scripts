#!/bin/bash
# This script will query covid data and display it

DATA=$(curl http://api.covidtracking.com/v1/us/current.json)
POSITIVE=$(echo $DATA | jq '.[0].positive')
NEGATIVE=$(echo $DATA | jq '.[0].negative')
PENDING=$(echo $DATA | jq '.[0].pending')
TOTALTESTRESULTS=$(echo $DATA | jq '.[0].totalTestResults')

TODAY=$(date)

echo "On $TODAY, there were $POSITIVE positive, $NEGATIVE negative, $PENDING pending COVID cases. There were $TOTALTESTRESULTS total test results."
