#!/bin/bash
#-----------------------------------------------------------------------------------#
# https://docs.aws.amazon.com/cli/latest/reference/emr/list-steps.html
#-----------------------------------------------------------------------------------#
CLUSTER=$(aws emr list-clusters --active | jq '.Clusters[0].Id' | sed -e 's/"//g')
aws emr list-steps --cluster-id ${CLUSTER} --max-items 1

