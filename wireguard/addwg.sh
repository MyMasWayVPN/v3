#!/bin/bash
# Mod By MasWayVPN
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
# Load params
source /etc/wireguard/params
source /var/lib/tarapkuhing/ipvps.conf
if [[ "$IP" = "" ]]; then
SERVER_PUB_IP=$(wget -qO- ipinfo.io/ip);
else
SERVER_PUB_IP=$IP
fi
source /var/lib/tarapkuhing/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
echo ""
portwg="$(cat ~/log-install.txt | grep -w "Wireguard" | cut -d: -f2|sed 's/ //g')"
until [[ ${CLIENT_NAME} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
	read -rp "Username : " -e CLIENT_NAME
	CLIENT_EXISTS=$(grep -w $CLIENT_NAME /etc/wireguard/wg0.conf | wc -l)

	if [[ ${CLIENT_EXISTS} == '1' ]]; then
		echo ""
		echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
		exit 1
	fi
done

echo "IPv4 Detected"
ENDPOINT="$domain:$SERVER_PORT"
WG_CONFIG="/etc/wireguard/wg0.conf"
LASTIP=$( grep "/32" $WG_CONFIG | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4 )
if [[ "$LASTIP" = "" ]]; then
CLIENT_ADDRESS="10.66.66.2"
else
CLIENT_ADDRESS="10.66.66.$((LASTIP+1))"
fi

# Adguard DNS by default
CLIENT_DNS_1="176.103.130.130"

CLIENT_DNS_2="176.103.130.131"
MYIP=$(wget -qO- ifconfig.co);
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# Generate key pair for the client
CLIENT_PRIV_KEY=$(wg genkey)
CLIENT_PUB_KEY=$(echo "$CLIENT_PRIV_KEY" | wg pubkey)
CLIENT_PRE_SHARED_KEY=$(wg genpsk)

# Create client file and add the server as a peer
echo "[Interface]
PrivateKey = $CLIENT_PRIV_KEY
Address = $CLIENT_ADDRESS/24
DNS = $CLIENT_DNS_1,$CLIENT_DNS_2

[Peer]
PublicKey = $SERVER_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
Endpoint = $ENDPOINT
AllowedIPs = 0.0.0.0/0,::/0" >>"$HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf"

# Add the client as a peer to the server
echo -e "### Client $CLIENT_NAME $exp
[Peer]
PublicKey = $CLIENT_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
AllowedIPs = $CLIENT_ADDRESS/32" >>"/etc/wireguard/$SERVER_WG_NIC.conf"
systemctl restart "wg-quick@$SERVER_WG_NIC"
cp $HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf /home/vps/public_html/$CLIENT_NAME.conf
clear
sleep 0.5
echo Generate PrivateKey
sleep 0.5
echo Generate PublicKey
sleep 0.5
echo Generate PresharedKey
clear
echo -e ""
echo -e " ⚡️ Detail Akun Wireguard ⚡️ "
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "Remarks  : $CLIENT_NAME"
echo -e "IP/Host  : $MYIP"
echo -e "Domain   : $domain"
echo -e "Port     : $portwg"
echo -e "Created  : $hariini"
echo -e "Expired  : $exp"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "Link WG  : http://$MYIP:89/$CLIENT_NAME.conf"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━\033[0;31m"
echo -e "Script By MasWayVPN"
rm -f /root/wg0-client-$CLIENT_NAME.conf
