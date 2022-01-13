Amazon Elastic MapReduce (EMR) Example
======================================

## EMR is an Amazon Web Services (AWS) tool for big data processing and analysis.

### Requirements:
* sudo yum install jq

### Create Credentials
* aws ec2 create-key-pair --key-name kluzbetak7 --output text > ~/.ssh/kluzbetak7.pem 


### Use Case
* This example simulate python scrypt wordcount.py to be executed in parallel on multiple servers Amazon Elastic MapReduce (EMR)


### Sequence of execution
* ./1b-create-cluster.sh
* ./upload-step-to-s3.sh
* ./2b-run-step.sh j-xxxxxxxxxxx
