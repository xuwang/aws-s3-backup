# Configure the AWS Provider
provider "aws" {
  region                   = "us-west-2"
  shared_credentials_file  = "/Users/xuwang/.aws/credentials"
  profile                  = "irt"
}