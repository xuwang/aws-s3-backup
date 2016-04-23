# You must have following evn defined: \
AWS_ACCESS_KEY_ID="anaccesskey" \
AWS_SECRET_ACCESS_KEY="asecretkey" \
AWS_DEFAULT_REGION="us-west-2" \

TF_DIR := terraform

# Terraform files
TF_PORVIDER := $(TF_DIR)/provider.tf
TF_DESTROY_PLAN := $(TF_DIR)/destroy.tfplan
TF_APPLY_PLAN := $(TF_DIR)/apply.tfplan
TF_STATE := $(TF_DIR)/terraform.tfstate

# Terraform commands
TF_GET := terraform get -update
TF_SHOW := terraform show
TF_GRAPH := terraform graph -draw-cycles -verbose
TF_PLAN := terraform plan
TF_APPLY := terraform apply 
TF_REFRESH := terraform refresh
TF_DESTROY := terraform destroy -force

all: apply

help:
	@echo "Terraform usage: make [ plan | apply | destroy | info | help ]"

plan: | ${TF_ACCOUNT}
	@cd ${TF_DIR}; mkdir artifacts; ${TF_PLAN}

apply: plan
	@cd ${TF_DIR}; ${TF_APPLY}

destroy: | ${TF_ACCOUNT}
	@cd ${TF_DIR}; ${TF_DESTROY} ; rm -rf artifacts

info:
	@cd ${TF_DIR}; ${TF_SHOW}


.PHONY: all plan apply destroy info help
