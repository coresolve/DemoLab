#!/bin/bash
AWS_CLUSTER_DNS=${AWS_CLUSTER_DNS:-tectonic.aws.alekssaul.com}
AWS_CLUSTER_name=${AWS_CLUSTER_name:-aleksdemo}
AWS_CLUSTER_region=${AWS_CLUSTER_region:-us-east-1}
AWS_CLUSTER_AZ=${AWS_CLUSTER_AZ:-us-west-1c}
echo `date` - Executing $0 ...

echo `date` - Checking for requirements ...
	if [[ $(which kube-aws) ]]; then
		echo `date` - 	'	Found gcloud binary'
	else 
		echo `date` - ERROR: Could Not Found kube-aws binary
		exit 1 ;
	fi

pushd `dirname $0`/cluster

echo `date` - Executing kube-aws Destroy...
kube-aws destroy

echo `date` - Cleaning up the assets ...
rm -rf credentials stack-template.json userdata
