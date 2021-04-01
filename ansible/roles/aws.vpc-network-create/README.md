Role Name
=========

* Create a VPC network on AWS
  * VPC
  * IGW
  * Subnets - Public + Private
  * Route table for each subnet

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

```yml
ops_igw_id: igw-0ccb79fd51d10a0f6
ops_public_subnets_routes: [{ dest: "0.0.0.0/0", gateway_id: "{{ ops_igw_id }}" }]
ops:
  vpc_name: ops_vpc
  igw_name: ops_vpc_igw
  cidr_block: 192.168.0.0/16
  aws_region: ap-south-1
  public_subnets:
    - { name: "aws-ap-south-1a-ops-public", cidr: "192.168.1.0/24", az: "ap-south-1a", routes: "{{ ops_public_subnets_routes }}" }
    - { name: "aws-ap-south-1b-ops-public", cidr: "192.168.2.0/24", az: "ap-south-1b", routes: "{{ ops_public_subnets_routes }}" }
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
---
- name: Create vpc in aws
  hosts: localhost
  connection: local
  gather_facts: False

  vars_files:
    - vars/dev/vpc.yml
    - vars/ops/vpc.yml

  tasks:
    - name: create vpc network
      include_role:
        name: aws.vpc-network-create
      with_items:
        - { vpc_name: "{{ dev.vpc_name }}", cidr_block: "{{ dev.cidr_block }}", region: "{{ dev.aws_region }}", subnets: "{{ dev.public_subnets }}", igw_name: "{{ dev.igw_name }}" }
        - { vpc_name: "{{ ops.vpc_name }}", cidr_block: "{{ ops.cidr_block }}", region: "{{ ops.aws_region }}", subnets: "{{ ops.public_subnets }}", igw_name: "{{ ops.igw_name }}" }
      loop_control:
        loop_var: outer_item
      tags:
        - vpc
        - igw
        - public_subnet
        - route_table
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
