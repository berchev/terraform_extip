# terraform_extip
Content of this repo is a gudeline on HOW to use a custom plugin with terraform.
For this example we are going to use following plugin: `https://github.com/petems/terraform-provider-extip`
The purpose of this plugin is to print the external ip as an output.

**Instructions below are tested on Ubuntu OS**

## Files
- `Vagrantfile` - Configuration file of our dev environment, where we are going to run this project
- `scripts/provision.sh` - script that install all needed software(Terraform and Go) and configure the Vagrant environment
- `terraform.d/plugins/linux_amd64/` the directory where we should place our compiled plugin
- `main.tf` - terraform configuration file


## Requrements
- Vagrant: [install Vagrant](https://www.vagrantup.com/docs/installation/)
- VirtualBox: install VirtualBox -> `sudo apt-get install -y virtualbox`

## Instructions how to run this project
- Download the content of **berchev/terraform_extip** repository: `git clone https://github.com/berchev/terraform_extip.git`
- Change to downloaded **terraform_extip** directory: `cd terraform_extip`
- Type `vagrant up` and wait the command to finish (Note that it can take up to 10 minutes, depending on your internet connection)
- Type `vagrant ssh` in order to connect to newly created vagrant environment
- From **Vagrant machine** type: `go get github.com/petems/terraform-provider-extip` in order to download the `extip` plugin source code
- Type `cd ~/go/src/github.com/petems/terraform-provider-extip` in order to get into downloaded plugin dorectory
- Execute `make build` command in order to compile the plugin
- If everything is OK you should be able to see the compiled plugin into **~/go/bin/** directory: `ls -al ~/go/bin/`
- Copy the custom plugin to the required path: 
  - `mkdir -p /vagrant/terraform.d/plugins/linux_amd64`
  - `cp ~/go/bin/terraform-provider-extip /vagrant/terraform.d/plugins/linux_amd64/`
- `main.tf` is already updated to use the plugin, so test it!
- Type `terraform init` in order to install all needed providers
- Type `terraform apply` followed by `yes` keyword when you are prompted for response

## Expected results
```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

external_ip = x.x.x.x
```

Where **x.x.x.x** will be your external IP address

## TODO
Kitchen test need to be prepared for this repo.
