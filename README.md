# ansible-infrastructure-tools-package
 tools package for it professionals

Lista de ferramentas

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

### Instalação

 - Faça a instalação do git

 apt-get install git

  - Faça a instalação da ultima versão do ansible:

  https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#

 - faça o clone do projeto abaixo:

 git clone https://github.com/leandrolanza/ansible-infrastructure-tools-package.git

 - execute o comando abaixo para realizar a instalação

 sudo ansible-playbook -i 127.0.0.1, ansible-infrastructure-tools-package/main.yml --become-user root --extra-vars "usuario=user"


--extra-vars "aws_access_key_id=YOUR_ACCESS_KEY"
--extra-vars "aws_secret_access_key=YOUR_SECRET_KEY"
