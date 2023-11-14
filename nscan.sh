bash i.sh
rm i.sh
figlet nscan |lolcat
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
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
echo -e "${GREEN}________________________Vulnerability Scanning Script________________________${ENDCOLOR}"

# Heartbleed vulnerability scan
nmap -p 443 --script ssl-heartbleed $site

# Shellshock vulnerability scan
nmap -p 80 --script http-shellshock $site

# POODLE vulnerability scan
nmap --script ssl-poodle -p 443 $site

# SMB vulnerabilities scan
nmap -p 445 --script smb-vuln* $site

# DNS vulnerabilities scan
nmap --script dns-vuln* $site

# SNMP vulnerabilities scan
nmap -p 161,162 --script snmp* $site

# FTP vulnerabilities scan
nmap -p 21 --script ftp* $site

# Additional features section
echo -e "${GREEN}________________________Additional Vulnerability Features________________________${ENDCOLOR}"

# Web Application Vulnerabilities scan
nmap -p 80,443 --script http-vuln* $site

# MySQL Vulnerabilities scan
nmap -p 3306 --script mysql-vuln* $site

# SNMP Enumeration scan
nmap -p 161,162 --script snmp-enum $site

# NFS Vulnerabilities scan
nmap -p 2049 --script nfs* $site

# MSRPC Vulnerabilities scan
nmap -p 135 --script msrpc* $site

# SMTP Vulnerabilities scan
nmap -p 25 --script smtp* $site

# PostgreSQL Vulnerabilities scan
nmap -p 5432 --script postgresql* $site

# Additional vulnerabilities
nmap -p 3389 --script rdp-vuln* $site   # RDP vulnerabilities
nmap -p 53 --script dns-recursion $site   # DNS Recursion check
nmap -p 389 --script ldap* $site   # LDAP vulnerabilities

# Final banner
echo -e "${GREEN}________________________Scan Completed________________________${ENDCOLOR}"

dirb http://$site -f
