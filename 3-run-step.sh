#!/bin/bash -x
#---------------------------------------------------------------------------------#
# sudo yum install jq
#---------------------------------------------------------------------------------#
APP_NAME='SparkWordCount03'

APP_FILE='s3://luzbetak/steps/wordcount2.py'
INPUT='s3://luzbetak/input/alice29.txt'
OUTPUT='s3://luzbetak/output-03/'
#---------------------------------------------------------------------------------#
# Get EMR cluster id
#---------------------------------------------------------------------------------#
CLUSTER=$(aws emr list-clusters --active | jq '.Clusters[0].Id' | sed -e 's/"//g')
#---------------------------------------------------------------------------------#
# Run step
#---------------------------------------------------------------------------------#
aws emr add-steps --cluster-id ${CLUSTER} \
    --steps Type=spark,Name=${APP_NAME},Args=[--deploy-mode,cluster,--master,yarn,--conf,spark.yarn.submit.waitAppCompletion=false,--num-executors,3,--executor-cores,3,--executor-memory,4G,${APP_FILE},${INPUT},${OUTPUT}],ActionOnFailure=CONTINUE

#---------------------------------------------------------------------------------#
