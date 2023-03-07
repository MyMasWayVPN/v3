#!/bin/bash
###########- COLOR CODE -##############
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
###########- END COLOR CODE -##########
# TOTAL ACC CREATE xray
xray=$(grep -c -E "^#xray " "/etc/xray/config.json")
# TOTAL ACC CREATE  pptp
pptp=$(grep -c -E "^#pptp " "/var/lib/tarapkuhing/data-user-pptp")
# TOTAL ACC CREATE  l2tp
l2tp=$(grep -c -E "^#l2tp " "/var/lib/tarapkuhing/data-user-l2tp")
# TOTAL ACC CREATE ss
ss=$(grep -c -E "^#ss " "/etc/shadowsocks-libev/akun.conf")
# TOTAL ACC CREATE  ssr
ssr=$(grep -c -E "^#ssr " "/usr/local/shadowsocksr/akun.conf")
# TOTAL ACC CREATE  sstp
sstp=$(grep -c -E "^#sstp " "/var/lib/tarapkuhing/data-user-sstp")
# TOTAL ACC CREATE trojango
trgo=$(grep -c -E "^#trgo " "/etc/trojan-go/akun.conf")
# TOTAL ACC CREATE wg
wg=$(grep -c -E "^#wg " "/etc/wireguard/wg0.conf")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
fi
Domen="$(cat /etc/xray/domain)"
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $2}')
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "  $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))

echo -e "${BR}   ┌───────────────────────────────────────────┐${NC}"
echo -e "${BR}   │${NC}  ${UNG}Domain${NC}      : $Domen"
echo -e "${BR}   │${NC}  ${UNG}Client Name${NC} : ${IJO}$Name${NC}"
echo -e "${BR}   │${NC}  ${UNG}Expiry In${NC}   : ${IJO}$certificate days${NC}"
echo -e "${BR}   └───────────────────────────────────────────┘${NC}"
echo -e "${BR}     ┌───────────────────────────────────────┐${NC}"
echo -e "${IJO}                   TOTAL ACCOUNTS${NC}"
echo -e "       —————————————————————————————————————" | lolcat
echo -e "${UNG}          SSH/OPENVPN${NC}    : ${IJO}$total_ssh${NC} "
echo -e "${UNG}          XRAY${NC}           : ${IJO}$xray${NC}"
echo -e "${UNG}          TROJAN${NC}         : ${IJO}$trgo${NC}"
echo -e "${UNG}          PPTP${NC}           : ${IJO}$pptp${NC}"
echo -e "${UNG}          L2TP${NC}           : ${IJO}$l2tp${NC}"
echo -e "${UNG}          SSTP${NC}           : ${IJO}$sstp${NC}"
echo -e "${UNG}          SS${NC}             : ${IJO}$ss${NC}"
echo -e "${UNG}          SSR${NC}            : ${IJO}$ssr${NC}"
echo -e "${UNG}          WIREGUARD${NC}      : ${IJO}$wg${NC}"
echo -e "${BR}     └───────────────────────────────────────┘${NC}"
echo -e "=================================================="  | lolcat
echo -e   "[${GREEN} 01 ${NC}]. •SSH & OpenVPN MENU"
echo -e   "[${GREEN} 02 ${NC}]. •VMESS MENU"
echo -e   "[${GREEN} 03 ${NC}]. •VLESS MENU"
echo -e   "[${GREEN} 04 ${NC}]. •SSTP MENU"
echo -e   "[${GREEN} 05 ${NC}]. •WIREGUARD MENU"
echo -e   "[${GREEN} 06 ${NC}]. •SHADOWSOCKS MENU"
echo -e   "[${GREEN} 07 ${NC}]. •SHADOWSOCKSR MENU"
echo -e   "[${GREEN} 08 ${NC}]. •L2TP MENU"
echo -e   "[${GREEN} 09 ${NC}]. •PPTP MENU"
echo -e   "[${GREEN} 10 ${NC}]. •TROJAN GFW MENU"
echo -e   "[${GREEN} 11 ${NC}]. •TROJAN GO MENU"
echo -e   "[${GREEN} 12 ${NC}]. •CEK SEMUA SERVICE VPN"
echo -e   "[${GREEN} 13 ${NC}]. •SETTING"
echo -e   "[${GREEN} 14 ${NC}]. •UPDATE [ SCRIPT ]"
echo -e   "[${RED} 15 ${NC}]. •Exit"
echo -e "=================================================="  | lolcat
echo -e   "\E[44;1;39m         ⇱ MOD BY MASWAY VPN ⇲                \E[0m"
echo -e   "\E[44;1;39m            ⇱ WA : 085754292950 ⇲                 \E[0m"
echo -e "=================================================="  | lolcat
read -p   "Select From Options [ 1 - 15 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
vmessmenu
;;
3)
clear
vlessmenu
;;
4)
clear
sstpmenu
;;
5)
clear
wgmenu
;;
6)
clear
ssmenu
;;
7)
clear
ssrmenu
;;
8)
clear
l2tpmenu
;;
9)
clear
pptpmenu
;;
10)
clear
trmenu
;;
11)
clear
trgomenu
;;
12)
clear
running
;;
13)
clear
setmenu
;;
14)
clear
update
;;
15)
clear
exit
;;
*)
clear
menu
;;
esac
