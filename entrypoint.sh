#!/bin/bash

if [ -z ${OC_URL} ]; then
  echo "OC_URL variable is not set, pass it to container!!!"
  echo "OC_URL suppose to point to your Openshift cluster."
  exit 1
elif [ -z ${OC_TOKEN} ]; then
  echo "OC_TOKEN variable is not set, pass it to container!!!"
  echo "OC_TOKEN is used to authenticate with Openshift cluster."
  exit 1
elif [ -z ${OC_PROJECT} ]; then
  echo "OC_PROJECT variable is not set, pass it to container!!!"
  echo "OC_PROJECT is used to login to specific Openshift project."
  exit 1
fi

export PYTHONIOENCODING=utf8
source /home/contest/fixit/.contest_venv/bin/activate
source /home/contest/.bashrc

# Login to Openshift cluster
oc login ${OC_URL} --token=${OC_TOKEN}
# Switch to project
oc project ${OC_PROJECT}

tmux new-session -s my "python contest"
