####
Instructions to replicate provided configuration on a new machine. 4640 assignment
####

*Note - Terraform should be installed to automate the droplet creation process.

To install Terraform you can visit the link below:

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli 

####
Step 1
####
Initially we have to create a .env file to source do_token which will be used to connect to our digitalocean account.

Create a token from digitalocean account and paste that in .env file like :

```bash
export TF_VAR_do_token=<token>
```

After saving token in .env file, we will source it :

```bash
source .env
```

###
Step 2
###

A brief information about the file structure used in this assignment:
```bash
- main.tf(provider info)
- variables.tf(variables, anything that you use twice, or could change(region, size…) )
- terraform.tfvars(variable values)
- output.tf(any output blocks, like ip addresses, and database connection uri)
- database.tf (includes db firewall)
- servers.tf(your droplets, load balancer and firewall for your servers)
- bastion.tf(includes firewall for bastion server)
- network.tf (your vpc)
- data.tf(data blocks, like your ssh keys)
- .env

```

To compile this project, start with command:
```bash
terraform init
``` 
To validate this project run:
```bash
terraform validate
```
To build all the resources defined in these files:

```bash
terraform apply
```
After running terraform apply command it will take around 5-6 minutes to build all the resources, after successful completion you should see all the created resources like this

![terraformapply.JPG](https://github.com/GurpreetSingh2601/images_4640/blob/master/terraformapply.JPG?raw=true)

Note - Apply the below command after testing that resources are created properly :
To destroy all the resources created

```bash
terraform destroy
```

###
Step 3
###

1. Testing that we can connect to bastion server:

Run the commands below to be able to login to bastion server and then web server

Note - Replace the values in brackets (<>)

```bash
eval $(ssh-agent)
ssh-add <path to private key in localhost>
ssh -A root@<publicIP of bastion server>
ssh root@<privateIP of web server>
```
Screenshots of successful login into bastion server and then to internal web server:
###
Bastion server
###

![bastion.JPG](https://github.com/GurpreetSingh2601/images_4640/blob/master/bastion.JPG?raw=true)

###
Web Server into bastion server
###

![webserver.JPG](https://github.com/GurpreetSingh2601/images_4640/blob/master/webserver.JPG?raw=true)

2. Testing the connection to our mongodb database:

Goto the digitalocean console and copy the database connection string and get the password from terraform.tfstate file

Then, goto the MongoDB Compass App and then copy the connection string with the right password:

![database.JPG](https://github.com/GurpreetSingh2601/images_4640/blob/master/database.JPG?raw=true)

The output should look like the image abouve after successful connection

Note - I temporarily removed the firewall rule which only allows to connect through web. Only for the purpose of verification that database is being set-up properly.






