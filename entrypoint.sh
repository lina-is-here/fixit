#!/bin/bash


if [ -z ${OC_URL} ]; then
  echo "OC_URL variable is not set, pass it to container!!!"
  echo "OC_URL suppose to point to your Openshift cluster."
  exit 1
elif [ -z ${OC_TOKEN} ]; then
  echo "OC_TOKEN variable is not set, pass it to container!!!"
  echo "OC_TOKEN is used to authentikate with Openshift cluster."
  exit 1
fi


source /home/contest/fixit/.contest_venv/bin/activate
tmux new-session -s my "python contest"
