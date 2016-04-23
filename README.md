# Provision Backup Bucket on AWS S3

* Create a AWS IAM user 
* IAM acces key for backup jobs
* Create a IAM policy for the backup user
* Create a AWS S3 bucket for backup data

## Provision

Edit env.sh and set AWS credentials.

```
$ source env.sh
$ echo 'provider "aws" { }' > terraform/provider.tf
$ make
...
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
```

## Destroy

```
$ make destroy
...
Apply complete! Resources: 0 added, 0 changed, 4 destroyed.
```