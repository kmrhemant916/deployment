#!/bin/sh

# aws cloudformation create-stack \
#   --stack-name sentry \
#   --template-body file://ec2.json \
#   --parameters ParameterKey=InstanceCount,ParameterValue=1 ParameterKey=InstanceType,ParameterValue=t1.micro \
#     ParameterKey=KeyPairName,ParameterValue=ec2 ParameterKey=OperatingSystem,ParameterValue=Linux \
#     ParameterKey=SSHLocation,ParameterValue=0.0.0.0/0 ParameterKey=TagKey,ParameterValue=Name \
#     ParameterKey=TagValue,ParameterValue=CodeDeployDemo \
#   --capabilities CAPABILITY_IAM


aws cloudformation create-stack --template-body file://ec2.yml --stack-name sentry --parameters ParameterKey=KeyName,ParameterValue=ec2 ParameterKey=InstanceType,ParameterValue=t2.micro
