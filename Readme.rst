KNAB DEMO DEPLOYMENT
#####################


Tools
*****
- AWS (Cloud)
- Docker (Container)
- Ansible (Configuration Management)
- Git (GitHub)
- Travis CI (Build & Deployments)


Deployment Architecture
*************************
.. image:: images/architecture.PNG

The deployment has two parts

Cloud Infrastructure deployment
-------------------------------
Terraform is used to deploy and configure AWS infrastructures. Terraform cloud is to store its state files and performing remote executions.

Docker Deployment
-----------------
Ansible is used to deploy and configre docker.

AWS components
---------------
 - VPC
 - Subnet
 - Internet Gateway
 - NACL to secure Subnet
 - EC2 instance with public Improve
 - SGs to secure Docker Host

Scopes for Improvement
**********************
    - Adding Load Balancer as FrontEnd (To improve Security, HA and Performance)
    - Passsing SSH Key securely (Travis Community edition does not support)
    - Adding AWS Network Firewall (More granular security)
    - Docker Network & Security
    - TLS configurations
