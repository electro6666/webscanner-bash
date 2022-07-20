apt install hr -y
apt install figlet -y
apt install lolcat -y
clear
figlet nscan |lolcat
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
apt update && upgrade
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
hr #
hr #
echo $site
host $site
hr #
sleep 1
echo $site
traceroute $site
hr #
sleep 1
echo $site
whois $site
whois -a $site
hr #
sleep 1
# you can add another ports
nmap -v  -p 80,22,25,53,6881,6999 --script http-sql-injection $site
hr #
sleep 1
nmap -v  -Pn --script vuln $site
hr #
nmap -T4 -A -v $site
sleep 1
nmap -sV -v   --script=http-malware-host $site
hr #
sleep 1
nmap -v  $site --script whois-ip
hr #
sleep 1
nmap -v  --script http-sitemap-generator.nse $site
hr #
echo 'wait........'
sleep 3
dirb http://$site
