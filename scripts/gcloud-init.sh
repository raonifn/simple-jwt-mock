#!/bin/bash -x

dir=$(dirname $0)

gcloud compute instances create sap --zone us-east1-b --address=sap-integration

gcloud compute scp $dir/remote/start.sh dextra@sap:/tmp
gcloud compute ssh dextra@sap -- /tmp/start.sh
#gcloud compute ssh dextra@sap -- 'cd simple-jwt-mock; nohup npm start > /dev/null 2>&1 &'
