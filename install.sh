#!/bin/bash

function CHECK_VERSION() {
	version=$(cut -c 8-12 /etc/issue)
	echo -e "SO versao $version"
}

function UPDATE() {
	if [ "$APTUPDATE" != "0" ]; then
		sudo apt-get update -qq
		APTUPDATE="0"
		echo "update OK"
	fi
}

function INSTALL_ANSIBLE() {
	if [ $version = "20.04" ]; then
		UPDATE
		sudo apt-get install git ansible -y >/dev/null 2>&1
		echo "Ansible instalado no ubuntu $version"
	else
		sudo add-apt-repository -y ppa:ansible/ansible >/dev/null 2>&1
		UPDATE
		sudo apt-get install -y software-properties-common git ansible >/dev/null 2>&1
		echo "Ansible instalado no ubuntu $version"
	fi
}

function CLONE_REPO() {
	CREATE_DIR=$(mkdir -p /tmp/ansible/ansible-desktop-automation)
	REPO_DIR="/tmp/ansible/ansible-desktop-automation"
	REPO_URL="https://github.com/leandrolanza/ansible-desktop-automation.git"

	echo "Cloning Repository in $REPO_DIR"

	git clone $REPO_URL $REPO_DIR >/dev/null 2>&1
}

function EXECUTE_ANSIBLE() {
	echo "Inicia Playbook..."
	mv $REPO_DIR/main.yml /tmp/ansible/
	mv $REPO_DIR/hosts /tmp/ansible/
	#ansible-playbook -i 127.0.0.1, ansible-infrastructure-tools-package/main.yml --ask-become-pass -K --extra-vars "usuario=$USER"
	ansible-playbook -i $REPO_DIR/hosts $REPO_DIR/main.yml
}

function MAIN() {
	CHECK_VERSION
	INSTALL_ANSIBLE
	CLONE_REPO
	EXECUTE_ANSIBLE
}

MAIN
