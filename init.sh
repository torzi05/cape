#!/bin/sh

# Weclome message
echo -e "\nCAPE - Common Ansible Practising Environment\n" 

# Test sudo access without password
sudo -nl &> /dev/null
rc="$?"

pw_check(){
if [[ -z "$pw" ]] ; then 
	echo "No password given" 
	exit 2  
fi
}

# Get the current user password
if [[ "$rc" -ne "0" ]] ; then
	read -sp "Please enter your password: " pw ; echo -e "\n" ; pw_check
fi

# Check given password
sudo_check(){
echo $pw | sudo -lS &> /dev/null
if [[ "$?" != "0" ]] ; then
	echo "Root access error"
	exit 3 
fi
}

sudo_check

# Check dependencies and install them
yum list installed virtualbox &> /dev/null		
if [[ "$?" -eq "0" ]] ; then
	echo -e "- VirtualBox				 \e[1;32mPASS\e[0;39m"
else
	echo Install Virtualbox
	echo $pw | sudo yum install -y VirtualBox
fi

yum list installed ansible &> /dev/null		
if [[ "$?" -eq "0" ]] ; then
	echo -e "- Ansible	  			 \e[1;32mPASS\e[0;39m"
else
	echo Install Ansible
	echo $pw | sudo yum install -y ansible
fi

yum list installed vagrant &> /dev/null		
if [[ "$?" -eq "0" ]] ; then
	echo -e "- Vagrant	 			 \e[1;32mPASS\e[0;39m"
else
	echo Install Vagrant
	wget https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm -O /tmp/vagrant.rpm
	echo $pw | sudo yum localinstall -y /tmp/vagrant.rpm
fi

ansible localhost -m command -a 'id' 

ansible localhost -m command -a 'id' --become

ansible localhost -m file -a 'path="/tmp/vagrant.rpm" state="absent"' -become
#ansible localhost -m file -a 'path="~/cape" state="directory"'
ansible localhost -m yum -a 'name="git" state="present"' --become
ansible localhost -m git -a 'repo="https://github.com/torzi05/cape.git" dest="~/cape"' 

cd ~/cape ; vagrant up 

