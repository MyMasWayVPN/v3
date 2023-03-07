#!/bin/bash

# ==========================================
expordateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\e33[1;36m'
BR='\033[0;35m'
IJO='\033[0;32m'
UNG='\033[0;33m'
LIGHT='\033[0;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\[${GREEN}${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
# ==========================================
# Getting

domain=$(cat /etc/xray/domain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e " ⚡️ Detail Akun SSH & OVPN ⚡️ "
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "\033[1;33mIP/Host       : $IP\033[1;33m"
echo -e "\033[1;33mIP/Host       : $IP\033[1;33m"
echo -e "\033[1;33mDomain        : ${domain}\033[1;33m"
echo -e "\033[1;33mUsername      : $Login\033[1;33m"
echo -e "\033[1;33mPassword      : $Pass\033[1;33m"
echo -e "\033[1;33mDropbear      : 109,143\033[1;33m"
echo -e "\033[1;33mSSL/TLS       : $ssl\033[1;33m"
echo -e "\033[1;33mPort Squid    : $sqd\033[1;33m"
echo -e "\033[1;33mOHP SSH       : 8181\033[1;33m"
echo -e "\033[1;33mOHP Dropbear  : 8282\033[1;33m"
echo -e "\033[1;33mOHP OpenVPN   : 8383\033[1;33m"
echo -e "\033[1;33mSsh Ws SSL    : $ws\033[1;33m"
echo -e "\033[1;33mSsh Ws No SSL : $ws2\033[1;33m"
echo -e "\033[1;33mOvpn Ws       : 2086\033[1;33m"
echo -e "\033[1;33mPort TCP      : $ovpn\033[1;33m"
echo -e "\033[1;33mPort UDP      : $ovpn2\033[1;33m"
echo -e "\033[1;33mPort SSL      : 990\033[1;33m"
echo -e "\033[1;33mOVPN TCP      : http://$IP:89/tcp.ovpn\033[1;33m"
echo -e "\033[1;33mOVPN UDP      : http://$IP:89/udp.ovpn\033[1;33m"
echo -e "\033[1;33mOVPN SSL      : http://$IP:89/ssl.ovpn\033[1;33m"
echo -e "\033[1;33mBadVpn        : 7100-7200-7300\033[1;33m"
echo -e "\033[1;33mCreated       : $hariini\033[1;33m"
echo -e "\033[1;33mExpired       : $exp\033[1;33m"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "\033[1;33mPayload Websocket TLS\033[1;33m"
echo -e "\033[0;33m==============================\033[0;33m"
echo -e "\033[1;33mGET wss://bug.com [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]\033[1;33m"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "\033[1;33mPayload Websocket No TLS\033[0;34m"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "\033[1;33mGET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]\033[1;33m"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "\033[0;31m Script Mod By MasWayVPN\033[0;31m"
