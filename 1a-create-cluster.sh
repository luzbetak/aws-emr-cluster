#!/bin/bash
#---------------------------------------------------------------------------------#
## Create AWS EMR Cluster
aws emr create-cluster                                                          \   
    --tags name="Kevin Luzbetak" department="Science"                           \   
    --release-label emr-5.9.0                                                   \   
    --applications Name=Spark                                                   \   
    --use-default-roles                                                         \   
    --ec2-attributes KeyName=apache-spark                                       \   
    --instance-groups                                                           \   
        InstanceGroupType=MASTER, InstanceCount=1, InstanceType=m5a.4xlarge     \   
        InstanceGroupType=CORE,   InstanceCount=2, InstanceType=m4.large        \   
    --auto-terminate

#---------------------------------------------------------------------------------#
