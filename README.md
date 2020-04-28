# ansible-infrastructure-tools-package
 tools package for it professionals

list tools

- chrome
- docker
- docker-compose
- postman
- spotify
- sublime
- teamviewer
- vscode
- unzip
- tilix
- awscli_v2
- terraform
- virtualbox
- skype

### in development

 - link instalação para ubuntu
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu

  - faça o download do projeto com o comando abaixo

  wget -O /etc/ansible/roles/master.zip https://github.com/leandrolanza/ansible-infrastructure-tools-package/archive/master.zip

   - faça unzip no arquivo

   unzip master.zip

   ansible-playbook --connection=local -i 127.0.0.1, ansible-infrastructure-tools-package/main.yml --ask-sudo-pass