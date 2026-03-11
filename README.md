# linux_training
1.ls
2.pwd
3.mkdir
4.whoami
5.touch
6.ls -a
7.ls -lh
8.:wq
9.adduser
10.passwd
11.exit
12.sudo yum install
13.cd ..
14.su
15.cat
16.vim
17.cd
18.vi
19.:q!
20.cal
21.date
22.cal -y
23.cal m y
24.time
25.history
26.rm -r 
27.id
28.ip address
29.ping
30.sudo -i


## Bash Script for Installation Automation

This Bash script automates the process of installing and configuring software services on a Red Hat Enterprise Linux server. The script accepts user input in natural language and processes the request to determine the required installation steps. It then generates and executes the necessary Linux commands automatically.

The script is designed to simplify system administration tasks by reducing manual command execution. It installs required packages using the `dnf` package manager, starts and enables system services using `systemctl`, and logs all activities into a log file for monitoring and troubleshooting.

This automation demonstrates how Bash scripting can be used to manage Linux services efficiently and streamline repetitive deployment tasks in cloud environments such as AWS EC2.

## Run following commands in ec2 user   
1.sudo dnf install curl jq -y   
2.export GEMINI_API_KEY="your_api_key_here"  
## Then create the script inside the root and paste the ai-installer.sh script  
