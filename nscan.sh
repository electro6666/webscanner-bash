apt update && apt upgrade -y
apt install python
clear
apt install python3
clear
pip install lolcat 
clear
apt install w3m -y
clear
apt install figlet -y
clear
apt install lolcat -y
clear
figlet nscan |lolcat
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
clear
apt install nmap -y
clear
apt install hr -y
clear
apt install traceroute -y
clear
apt  install dnsutils -y
clear
apt install dirb -y
clear
apt install whois -y
clear
echo -e "${RED}Enter Target:${ENDCOLOR}"
read site
clear
figlet -f smslant  nscan |lolcat
echo -e "${GREEN}________________________nscan by electro566_____${ENDCOLOR}"
echo $site
host $site
sleep 1
echo http://$site
traceroute $site
sleep 1
echo http://$site
w3m -dump_head $site| grep "^HTTP\/"
whois $site | grep 'Name Server'
whois -a $site
sleep 1
# you can add another ports
nmap -v  -p 80,22,25,53,6881,6999 --script http-sql-injection $site
sleep 1
nmap -v  -Pn --script vuln $site
nmap -T4 -A -v $site
sleep 1
nmap -sV -v   --script=http-malware-host $site
sleep 1
nmap -v  $site --script whois-ip
sleep 1
nmap -v  --script http-sitemap-generator.nse $site
echo 'wait........' 
sleep 4
dirb http://$site -f
