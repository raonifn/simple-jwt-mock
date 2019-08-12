#!/bin/bash

dir=$(dirname $0)

gcloud compute instances create sap --address=sap-integration

gcloud compute scp $dir/remote/start.sh dextra@sap:/tmp
gcloud compute ssh dextra@sap -- /tmp/start.sh
