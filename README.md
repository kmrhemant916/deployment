#### Sentry
Ansible script to configure and install Sentry


### Steps on how to run playbook:

1. AWS keys are configured in environment to use CLI
2. Required latest ansible==2.7.7, boto, boto3 and python
3. Ansible configuration should point to ansible.cfg
4. EC2 key pair admin.pem should be placed in ~/.ssh
5. Run from ansible directory: ansible-playbook -i hosts sentry-server-configure.yml
6. After EC2 (sentry-server) is up. Change inventory file with the allocated IPv4 Public IP provided by AWS
