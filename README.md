# ARHEIO Infrastructure

A repo provisioning my infrastructure

## What does Terraform do?

Terraform is an `Infrastructure as Code` service. A developer can create a bunch of configuration files, and tell Terraform to run them. Terraform can then go create a bunch of services using the config that we defined.

For example, we can provision a Buildkite agent for an AWS account:
* Set up IAM policies
* Setup an S3 bucket for artefacts
* Setup an S3 bucket for secrets

## What's this CLI thing?

aws-vault exec e1sbx -- aws s3 ls

aws-vault exec e1sbx -- docker-compose -f docker-compose.ci.yml run deploy ops/run.sh init arheio-service


## Running Locally

The advised way to provision something is to push to main and let terraform provision it through the Buildkite agent

But there are cases to run things locally, for example the Buildkite agent.
