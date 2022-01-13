#!/bin/bash -x
#---------------------------------------------------------------------------------#
## Run EMR Step
aws emr add-steps --cluster-id j-xxxxx                         \   
       --steps Type=spark,Name=SparkWordCountApp,              \   
       Args=[                                                  \   
          --deploy-mode,cluster,--master,yarn,                 \   
          --conf,spark.yarn.submit.waitAppCompletion=false,    \   
          --num-executors,5,--executor-cores,5,                \   
          --executor-memory,64g,                               \   
          s3://codelocation/word-count.py,                     \   
          s3://inputbucket/input.txt,                          \   
          s3://outputbucket/                                   \   
          ],                                                   \   
       ActionOnFailure=CONTINUE
#---------------------------------------------------------------------------------#
