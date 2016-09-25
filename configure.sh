#!/bin/bash 

### Main Variables
export DemoLab_Infra=aws
export DemoLab_SETUP_JENKINS=true
export DemoLab_SETUP_TECTONIC=true
export DemoLab_SETUP_WEBHOOK=true
export DemoLab_Infra_TORUS=false
export DemoLab_RootFolder=$PWD

### Variables for GCP
if [ $DemoLab_Infra="gcp" ]; then
	export KUBERNETESFETCH=false
	export KUBERNETESLOCATION=$HOME/dev/workspace/kubernetes
	export ENABLE_NODE_AUTOSCALER=false
	export AUTOSCALER_MAX_NODES=5
fi 

### Variables for AWS
if [ $DemoLab_Infra="aws" ]; then
	export AWS_CLUSTER_DNS=tectonic.alekssaul.com
	export AWS_CLUSTER_name=aleksdemo
	export AWS_CLUSTER_region=us-west-1
	export AWS_CLUSTER_AZ=us-west-1c
	export AWS_CONFIG_controllerinstancetype=m3.medium
	export AWS_CONFIG_workerinstancetype=m3.medium
	export AWS_CONFIG_workerCount=2
	export AWS_DEFAULT_REGION=$AWS_CLUSTER_region
fi 

### Variables for Tectonic
if [ $DemoLab_SETUP_TECTONIC="true" ]; then
	export DemoLab_SETUP_TECTONIC_Enterprise="true"
	export TECTONICNAMESPACE=tectonic-system
	export TECTONIC_PULL_SECRET=$HOME/Downloads/coreos-pull-secret.yml
fi

### Variables for Webhook
if [ $DemoLab_SETUP_WEBHOOK="true" ]; then
	export WEBHOOKNAMESPACE=webhook
fi

### Variables for Webhook
if [ $DemoLab_SETUP_JENKINS="true" ]; then
	JENKINSNAMESPACE=jenkins
	JENKINSRESTORE=true
	JENKINSRESTORELOCATION=/tmp/jenkins-home.tar.gz
	JENKINSDISK=jenkins-home
	JENKINSPULLSECRET=$HOME/Downloads/dockercfg
	KUBEMASTER=kubernetes-master
	GCLOUDSTORAGE=asaul-jenkins
	JENKINSBACKUPFILE=jenkins-home.tar.gz
fi