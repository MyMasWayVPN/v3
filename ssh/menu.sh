#!/bin/bash
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

echo -e "===================================================" | lolcat
echo -e   "\E[44;1;39m              ⇱ PREMIUM AUTO SCRIPT ⇲             \E[0m"
echo -e   "\E[44;1;39m                    ⇱ BY MasWayVPN ⇲               \E[0m"
echo -e "===================================================" | lolcat
echo -e ""
echo -e "$RED SSH & OPENVPN $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 1${NC} ].Create SSH & OpenVPN Account"
echo -e "[${GREEN} 2${NC} ].Generate SSH & OpenVPN Trial Account"
echo -e "[${GREEN} 3${NC} ].Extending SSH & OpenVPN Account Active Life"
echo -e "[${GREEN} 4${NC} ].Check User Login SSH & OpenVPN"
echo -e "[${GREEN} 5${NC} ].Daftar Member SSH & OpenVPN"
echo -e "[${GREEN} 6${NC} ].Delete SSH & OpenVpn Account"
echo -e "[${GREEN} 7${NC} ].Delete User Expired SSH & OpenVPN"
echo -e "[${GREEN} 8${NC} ].Set up Autokill SSH"
echo -e "[${GREEN} 9${NC} ].Displays Users Who Do Multi Login SSH"
echo -e "[${GREEN} 10${NC} ].Restart All Service"
echo -e ""
echo -e "$yRED L2TP $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 11${NC} ].Create Account L2TP"
echo -e "[${GREEN} 12${NC} ].Delete Account L2TP"
echo -e "[${GREEN} 13${NC} ].Extending Account L2TP Active Life"
echo -e ""
echo -e "$RER PPTP $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 14${NC} ].Create Account PPTP"
echo -e "[${GREEN} 15${NC} ].Delete Account PPTP"
echo -e "[${GREEN} 16${NC} ].Extending Account PPTP Active Life"
echo -e ""
echo -e "$RED SSTP $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 17${NC} ].Create Account SSTP"
echo -e "[${GREEN} 18${NC} ].Delete Account SSTP"
echo -e "[${GREEN} 19${NC} ].Extending Account SSTP Active Life"
echo -e "[${GREEN} 20${NC} ].Check User Login SSTP"
echo -e ""
echo -e "$RED WIREGUARD $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 21${NC} ].Create Account Wireguard"
echo -e "[${GREEN} 22${NC} ].Delete Account Wireguard"
echo -e "[${GREEN} 23${NC} ].Extending Account Wireguard Active Life"
echo -e ""
echo -e "$RED SHADOWSOCKS $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 24${NC} ].Create Account Shadowsocks"
echo -e "[${GREEN} 25${NC} ].Delete Account Shadowsocks"
echo -e "[${GREEN} 26${NC} ].Extending Account Shadowsocks Active Life"
echo -e "[${GREEN} 27${NC} ].Check User Login Shadowsocks"
echo -e ""
echo -e "$RED SHADOWSOCKSR $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 28${NC} ].Create Account SSR"
echo -e "[${GREEN} 29${NC} ].Delete Account SSR"
echo -e "[${GREEN} 30${NC} ].Extending Account SSR Active Life"
echo -e "[${GREEN} 31${NC} ].Show Other SSR Menu"
echo -e ""
echo -e "$RED XRAYS / VMESS $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 32${NC} ].Create Account XRAYS Vmess Websocket"
echo -e "[${GREEN} 33${NC} ].Delete Account XRAYS Vmess Websocket"
echo -e "[${GREEN} 34${NC} ].Extending Account XRAYS Vmess Active Life"
echo -e "[${GREEN} 35${NC} ].Check User Login XRAYS Vmess"
echo -e "[${GREEN} 36${NC} ].Renew Certificate XRAYS Account"
echo -e ""
echo -e "$RED XRAYS / VLESS $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 37${NC} ].Create Account XRAYS Vless Websocket"
echo -e "[${GREEN} 38${NC} ].Delete Account XRAYS Vless Websocket"
echo -e "[${GREEN} 39${NC} ].Extending Account XRAYS Vless Active Life"
echo -e "[${GREEN} 40${NC} ].Check User Login XRAYS Vless"
echo -e ""
echo -e "$RED XRAYS / TROJAN $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 41${NC} ].Create Account XRAYS Trojan"
echo -e "[${GREEN} 42${NC} ].Delete Account XRAYS Trojan"
echo -e "[${GREEN} 43${NC} ].Extending Account XRAYS Trojan Active Life"
echo -e "[${GREEN} 44${NC} ].Check User Login XRAYS Trojan"
echo -e ""
echo -e "$RED TROJAN GO $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 45${NC} ].Create Account Trojan Go"
echo -e "[${GREEN} 46${NC} ].Delete Account Trojan Go"
echo -e "[${GREEN} 47${NC} ].Extending Account Trojan Go Active Life"
echo -e "[${GREEN} 48${NC} ].Check User Login Trojan Go"
echo ""
echo -e "$RED SYSTEM $NC"
echo -e "===================================================" | lolcat
echo -e "[${GREEN} 49${NC} ].Add Or Change Subdomain Host For VPS"
echo -e "[${GREEN} 50${NC} ].Change Port Of Some Service"
echo -e "[${GREEN} 51${NC} ].Autobackup Data VPS"
echo -e "[${GREEN} 52${NC} ].Backup Data VPS"
echo -e "[${GREEN} 53${NC} ].Restore Data VPS"
echo -e "[${GREEN} 54${NC} ].Webmin Menu"
echo -e "[${GREEN} 55${NC} ].Limit Bandwith Speed Server"
echo -e "[${GREEN} 56${NC} ].Check Usage of VPS Ram"
echo -e "[${GREEN} 57${NC} ].Reboot VPS"
echo -e "[${GREEN} 58${NC} ].Speedtest VPS"
echo -e "[${GREEN} 59${NC} ].Displaying System Information"
echo -e "[${GREEN} 60${NC} ].Info Script Auto Install"
echo -e "===================================================" | lolcat
echo -e ""
read -p "Select From Options [ 1 - 60 ] : " menu
echo -e ""
case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
cekssh
;;
5)
member
;;
6)
delssh
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
11)
addl2tp
;;
12)
dell2tp
;;
13)
renewl2tp
;;
14)
addpptp
;;
15)
delpptp
;;
16)
renewpptp
;;
17)
addsstp
;;
18)
delsstp
;;
19)
renewsstp
;;
20)
ceksstp
;;
21)
addwg
;;
22)
delwg
;;
23)
renewwg
;;
24)
addss
;;
25)
delss
;;
26)
renewss
;;
27)
cekss
;;
28)
addssr
;;
29)
delssr
;;
30)
renewssr
;;
31)
ssr
;;
32)
addvmess
;;
33)
delvmess
;;
34)
renewvmess
;;
35)
cekvmess
;;
36)
certv2ray
;;
37)
addvless
;;
38)
delvless
;;
39)
renewvless
;;
40)
cekvless
;;
41)
addtrojan
;;
42)
deltrojan
;;
43)
renewtrojan
;;
44)
cektrojan
;;
45)
addtrgo
;;
46)
deltrgo
;;
47)
renewtrgo
;;
48)
cektrgo
;;
49)
addhost
;;
50)
changeport
;;
51)
autobackup
;;
52)
backup
;;
53)
restore
;;
54)
wbmn
;;
55)
limitspeed
;;
56)
ram
;;
57)
reboot
;;
58)
speedtest
;;
59)
info
;;
60)
about
;;
*)
clear
menu
;;
esac
