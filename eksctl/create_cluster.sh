#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Check if cluster exists first
eksctl create cluster --profile eksbot --config-file=eksctl-config.yml

# Return valid JSON string
eksctl get cluster --profile eksbot --name jupyterhub -o json | jq -r ".[] | {Arn:.Arn}"
