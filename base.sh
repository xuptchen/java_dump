#!/bin/bash
echo -e "\033[30;32m"

echo ""

echo "**********欢迎登陆本应用服务器***********"

echo " initialization.sh 查看系统初始化信息"

echo "******************************************"

echo "主机名："
#!/bin/bash

#系统名称；
os_type=$(uname -o | awk '{print " | "$0}')
#系统位数；32/64
os_bit=$(uname -m | awk '{print " | "$0}')

#内核发型版本
kernal_version=$(uname -r | awk '{print " | "$0}')

#系统版本信息
sys_info=$(cat /etc/issue | awk '{if($0 ~ /^\w/){print " | "$0}}')

#物理CPU个数：
cpu_actual_number=$(cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l | awk '{print " | "$0}')

#逻辑cpu个数：
cpu_virtal_number=$(cat /proc/cpuinfo| grep "processor"| wc -l | awk '{print " | "$0}')

#cpu型号
cpu_version=$(cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c | awk '{for(i=2; i<=NF; i++){printf $i" "}}' | awk '{print " | "$0}' )

#内存：
mem_info_total=$(free -h | awk '{print " | "$0}' )

#联网情况：
net_conditon=$(ping -c 1 baidu.com | grep ttl | wc -l)

#磁盘信息：
disk_info=$(fdisk -l | grep "Disk /dev" | awk '{print " | "$0}' )
disk_info_using=$(df -h)

#主机名称
htname=$(hostname | awk '{print " | "$0}')

#网卡列表
eth_list=$(ip addr | awk '{if($0 ~ /^[0-9]\:(.*)$/){print $2}}' | cut -d ":" -f 1 | awk '{print " | "$0}')

#IP信息
ip_list=$(ip addr | grep -E 'inet\b' | awk '{print $2}' | cut -d "/" -f 1 | awk '{print " | "$0}')

#内存信息
fre_list=$(free -h | awk '{print " | "$0}')

#硬盘使用信息
fd_list=$(fdisk -l | grep "Disk /dev" | awk '{print " | "$0}')

#相关端口信息
port_list=$(netstat -lntup | awk '{print " | "$0}')


#系统io信息
echo "系统的io信息"
io=$(iostat | awk '{print " | "$0}')

#硬盘挂载信息
mount=$(df -h  | awk '{print " | "$0}')

#进程实时信息
ps_list=$(top -n 1 | awk '{print " | "$0}')

echo -e "\n\n"
echo " 系统基本信息"
echo "---------------------------------------------------------------------------------------"
echo "系统名称：$os_type"
echo "主机名称: $htname"
echo "系统位数: $os_bit"
echo "内核版本：$kernal_version"
echo "系统版本:	$sys_info"
echo "物理CPU个数：$cpu_actual_number"
echo "逻辑CPU个数：$cpu_virtal_number"
echo "CPU型号：$cpu_version"
echo "网卡列表：$eth_list"
echo "IP信息：$ip_list"
echo "内存信息: $fre_list"
echo "硬盘使用信息：$fd_list"
echo "相关端口信息: $port_list"
echo "系统io信息: $io"
echo "硬盘挂载信息: $mount"
echo "进程实时信息: $ps_list"
