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
	APP_NAME="ansible-desktop-automation"
	APP_DIR="/tmp/ansible"
	CREATE_APP_DIR=$(mkdir -p $APP_DIR/$APP_NAME)
	REPO_DIR="$APP_DIR/$APP_NAME"
	REPO_URL="https://github.com/leandrolanza/ansible-desktop-automation.git"

	echo "Cloning Repository in $REPO_DIR"

	git clone $REPO_URL $REPO_DIR >/dev/null 2>&1
}

function EXECUTE_ANSIBLE() {
	echo "Inicia Playbook..."
	cp $REPO_DIR/main.yml $APP_DIR
	cp $REPO_DIR/hosts $APP_DIR
	ansible-playbook -i $APP_DIR/hosts $APP_DIR/main.yml --extra-vars "usuario=$USER"
}

function MAIN() {
	CHECK_VERSION
	INSTALL_ANSIBLE
	CLONE_REPO
	EXECUTE_ANSIBLE
}

MAIN
