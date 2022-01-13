#!/bin/bash
#---------------------------------------------------------------------------------#
INSTANCE='m4.4xlarge'
EMR_VERSION='emr-5.9.0'

#---------------------------------------------------------------------------------#
echo "Starting EMR Cluster 1"
aws emr create-cluster --applications Name=Spark Name=Hadoop Name=Hive Name=Pig \
    --tags name="Kevin Luzbetak" department="DBEng" \
    --release-label ${EMR_VERSION}                  \
    --use-default-roles                             \
    --log-uri s3://luzbetak/logs/                   \
    --ec2-attributes KeyName=kluzbetak7             \
    --instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=${INSTANCE} InstanceGroupType=CORE,InstanceCount=2,InstanceType=${INSTANCE} \
    --steps Type=CUSTOM_JAR,Name=CustomJAR,ActionOnFailure=CONTINUE,Jar=s3://region.elasticmapreduce/libs/script-runner/script-runner.jar,Args=["s3://luzbetak/steps/90-cluster-step.sh"]
    --auto-terminate

#---------------------------------------------------------------------------------#
