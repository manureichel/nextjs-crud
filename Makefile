TFVARS_FILE = ../env/dev.tfvars

.PHONY: init format plan apply destroy

init:
	cd terraform && terraform init

format:
	cd terraform && terraform fmt -recursive

plan: format
	cd terraform && terraform plan -var-file=$(TFVARS_FILE)


apply: format
	cd terraform && terraform apply -var-file=$(TFVARS_FILE)
	@echo 🚀 Apply completed!

autoapply: format
	cd terraform && terraform apply -var-file=$(TFVARS_FILE) -auto-approve
	@echo 🚀 Apply completed!

destroy:
	@echo ⚠️  ⚠️ This will destroy all your managed infrastructure on cloud   ⚠️  ⚠️
	cd terraform && terraform destroy -var-file=$(TFVARS_FILE)
	@echo 💥 Destroy completed! 💥

