#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Return valid JSON string
eksctl get cluster --name jupyterhub -o json --profile eksbot | jq -r ".[] | {Arn:.Arn}"
