# Devops terraform challenge

# Problem statement :- 
An assignment is to create a CloudFormation template / terraform stack which will create:

A VPC in us-west-1 that contains :
    A private subnet in us-west-1a
        One t2.small Instance in this private subnet
    A public subnet in us-west-1b
        One t2.small Instance in this public subnet, with a public IP

The template should output :
The Public IP of the instance in the public subnet
The Private IP of the instance in the private subnet

These two instances should have internet access which means :
The Public Instance's traffic must go through an Internet Gateway in the VPC
The Private Instance's traffic must go through a NAT Gateway in the VP

```
#Solution:- under the devops-challenge you will find out below .tf files.
instance.tf               it will create two instances , one public and one private \n
mykey			          private key
nat.tf			          create NAT and attched with private subnet
securitygroup.tf	      create security group and allow ssh port
vpc.tf                    creat VPC , IG with requied availabilty zone etc	
key.tf		              Required key to attached with the instance to access the instance later	
mykey.pub	              public key
provider.tf	              described region 
vars.tf                   all the required variable declaration

```
# Note :- Keys are the dummy keys

```
# How to RUN
1:- Download the repo
Inside the folder run the below commands
2:- terraform init  
3:- terraform plan -out out.terraform 
4:- terraform apply out.terraform
```


Note :- There is NO availbilty zone 1b in us-west-1 , So I choose 1c for Public instance. 
![Screenshot](https://github.com/Gaurav2586/devops-challenge/blob/master/zone.png?raw=true "zone")


**Result**
![Screenshot](https://github.com/Gaurav2586/devops-challenge/blob/master/Result.png?raw=true "Result")
