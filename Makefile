GATEWAY_USER_RC=$(shell grep "^gateway_user " .devenvrc | sed "s/gateway_user //")

setup:
	echo 'create-lxc-project -h'

provision:
	ansible-playbook development.yml -i hosts --ask-sudo-pass --ask-vault-pass -e gateway_user=$(GATEWAY_USER_RC)
