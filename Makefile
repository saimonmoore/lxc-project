PROJECT_NAME=$(shell grep "^project_name " .devenvrc | sed "s/project_name //")
DOMAIN=$(shell grep "^domain " .devenvrc | sed "s/domain //")
GATEWAY_USER_RC=$(shell grep "^gateway_user " .devenvrc | sed "s/gateway_user //")
RECIPE=$(shell grep "^type " .devenvrc | sed "s/type //")

setup:
	echo 'create-lxc-project -h'

provision:
	ansible-playbook $(RECIPE).yml -i hosts --ask-sudo-pass -e gateway_user=$(GATEWAY_USER_RC) domain=$(DOMAIN) project_name=$(PROJECT_NAME)
