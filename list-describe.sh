#!/bin/bash

CLUSTER=$(aws emr list-clusters --active | jq '.Clusters[0].Id' | sed -e 's/"//g')
aws emr describe-cluster --cluster-id ${CLUSTER} 

