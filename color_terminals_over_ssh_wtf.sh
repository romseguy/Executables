cd
cat << 'EOF' >color_terminals_over_ssh.sh
#!/bin/bash
#Must pass either enable or disable to script
#./color_terminals_over_ssh.sh enable

DO=$1

if [[ $DO = "enable" ]]
then
 sudo sed -i '/force_color_prompt=yes/s/^#//g' /home/*/.bashrc
 sudo sed -i '/force_color_prompt=yes/s/^#//g' /root/.bashrc
 sudo su
elif [[ $DO = "disable" ]]
then
 sudo sed -i '/force_color_prompt=no/s/^/#/g' /home/*/.bashrc
 sudo sed -i '/force_color_prompt=no/s/^/#/g' /root/.bashrc
 sudo su
fi

cat ~/.bashrc | grep force_color_prompt=yes

EOF
