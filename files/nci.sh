#!/bin/bash

echo "loading virtual environment"
source  /opt/nci-ansible-ui/data/venvansible/bin/activate 
( cd /opt/nci-ansible-ui ; source data/venvansible/bin/activate ; ./node_modules/.bin/nci )

