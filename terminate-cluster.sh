#!/bin/bash
#---------------------------------------------------#
if [ -z "$1" ]
  then
    echo "+----------------------------------------------+"
    echo "|         No cluster-id supplied               |" 
    echo "|  Example:                                    |"
    echo "|  ./terminate-cluster.sh j-S8U2D7S26BSK       |"
    echo "+----------------------------------------------+"
    exit
fi

aws emr terminate-clusters --cluster-ids ${1}

