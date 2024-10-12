# Variáveis
ENV ?= dev
TF_DIR = ./terraform
BACKEND_CONFIG = $(TF_DIR)/backend.$(ENV).tfvars
TF_VARS = $(TF_DIR)/terraform.$(ENV).tfvars

# Comandos comuns
TF_CMD = terraform
TF_APPLY_FLAGS = -auto-approve

# Targets
.PHONY: init plan aplly destroy

# Inicializa o Terraform com backend correto
init:
	@echo "Iniciando o Terraform no ambiente $(ENV)"
	cd $(TF_DIR) && terraform init -backend-config$(BACKEND_CONFIG)

# Gera o plano de execução
plan:
	@echo "Planejando a infraestrutura no ambiente $(ENV)..."
	cd $(TF_DIR) && terraform plan -var-file=$(TF_VARS)

# Aplica as mudanças na infraestrutura
apply:
	@echo "Aplicando mudanças na infraestrutura no ambiente $(ENV)..."
	cd $(TF_DIR) && terraform apply -var-file=$(TF_VARS) -auto-approve

# Destrói a infraestrutura
destroy:
	@echo "Destruindo a infraestrutura no ambiente $(ENV)..."
	cd $(TF_DIR) && terraform destroy -var-file=$(TF_VARS) -auto-approve

