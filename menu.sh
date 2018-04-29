#!/bin/bash
clear
if [ ! -e /bin/adm-pro ]; then
echo "#!/bin/bash" > /bin/adm-pro
chmod 777 /bin/adm-pro
else
/bin/adm-pro
fi
if [ -d /etc/adm ]; then
echo ""
else
mkdir /etc/adm
fi
if [ -d /etc/adm/usuarios ]; then
echo ""
else
mkdir /etc/adm/usuarios
fi
if [ -d /etc/adm/modulo ]; then
echo ""
else
mkdir /etc/adm/modulo
fi
#lop#
while true
do
clear
#/lop#
if [[ -e /etc/squid/squid.conf ]]; then
squid="on"
else
 if [[ -e /etc/squid3/squid.conf ]]; then
squid="on"
else
squid="off"
 fi
fi
neofetch
echo -e "\033[0;35m#############################################\033[0m"
echo -e "\033[1;36m            ️ BIENVENIDO AL MENÚ \033[0m"
if [ "$1" = "" ]; then
system=$(cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //')
echo -e "\033[1;32m● EL SISTEMA ES:\033[1;36m$system\033[0m"
if [[ -e /etc/adm/modulo/atualiza ]]; then
 if [[ -e /bin/atualiz ]]; then
menufun adm3
 fi
fi
if [ -e /etc/adm/bnr ]; then
/etc/adm/bnr
fi
echo
echo -e "\033[0;35m############################################\033[0m"
echo
echo -e "\e[1;36m                    CONECTANDO                 \e[0m"
echo -e "\e[1;34m\e[1;34m"
figlet JC NOVATO 
echo -e "\e[1;32m               AL INTERNET AVANZADO      \e[0m"
echo
echo -e "\033[0;31m============================================\033[0m"
echo -e "\033[1;32m|0| [ VOLVER | SALIR ]\033[0m"
if [[ -e /bin/adm ]]; then
echo -e "\033[1;33m|1|\033[1;36m ● \033[1;36mADMINISTRAR USUARIOS"
fi
if [[ -e /bin/adm2 ]]; then
echo -e "\033[1;33m|2|\033[1;36m ● ADMINISTRAR VPS"
fi
if [[ -e /bin/adm3 ]]; then
echo -e "\033[1;33m|3|\033[1;36m ● MENU DE HERRAMIENTAS"
fi
if [[ "$squid" != "on" ]]; then
echo -e "\033[1;33m|4|\033[1;36m ● \033[1;36mINSTALAR SQUID3\033[0m"
fi
if [[ -e /etc/adm/modulo/apache ]]; then
echo -e "\033[1;36m|5| ● APACHE ACTIVO\033[0m"
else
echo -e "\033[1;33m|5|\033[1;36m ● \033[1;36mINSTALAR SERVIDOR APACHE\033[0m"
fi
echo -e "\033[1;33m|6|\033[1;36m ● \033[1;36mINSTALAR DROPBEAR\033[0m"
echo -e "\033[1;33m|7|\033[1;36m ● \033[1;36mACTIVAR PROXY PYTHON2\033[0m"
echo -e "\033[1;33m|8|\033[1;36m ● \033[1;36mACTIVAR PROXY BITEL 53 APN\033[0m"
echo -e "\033[1;33m|9|\033[1;36m ● \033[1;36mINFORMACIÓN DEL SCRIPT\033[0m"
echo -e "\033[1;33m10|\033[1;36m ● \033[1;36mINSTALAR OPENVPN + MENU\033[0m"
echo -e "\033[0;31m===============================================\033[0m"
echo -e "\033[1;32mPUERTOS ABIERTOS POR DEFECTO\033[0m" 
echo -e "\033[1;36m> OPENSSH: 22\033[0m"
echo -e "\033[1;32m> DROPBEAR: 443\033[0m"
echo -e "\033[1;36m> SQUID3: 3128\033[0m"
echo -e "\033[1;32m> WEBM: 10000\033[0m"
echo -e "\033[1;36m> PYTHON2: 1080\033[0m"
echo -e "\033[1;32m> APACHE: 81\033[0m"
echo -e "\033[1;36m> OPENVPN: 1194,etc\033[0m"
echo -e "\033[1;32m> BADVPN: 7300\033[0m"
echo -e "\033[1;36m> PARA ABRIR MAS PUERTOS PYTHON:\033[0m"
echo -e "\033[1;32m- Ejecute: screen python real10.py [port] &\033[0m"
echo -e "\033[1;36m- Ejemplo: screen python real10.py 9090 &\033[0m"
echo -e "\033[0;31m∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞=∞\033[0m"
echo -e "\033[1;33m \033[1;33m"
read -p "NÚMERO: " opc
else
opc="$1"
fi
case $opc in
0)
break
exit
;;
1)
adm
break
;;
2)
adm2
break
;;
3)
adm3
break
;;
4)
sq3
break
;;
5)
#Apache2#
if [ -e /etc/apache2/apache2.conf ]; then
touch /etc/adm/modulo/apache
fi
if [[ ! -e /etc/adm/modulo/apache ]]; then
echo -e "\033[1;31mDESEJA INSTALAR O SISTEMA WEB PARA QUE SUS ARCHIVOS OPENVPN ESTEN DISPONIBLES ONLINE? PARA QUE SEA FACIL VIA NAVEGADOR?\033[0m"
read -p "[s/n]: " apache
 if [ "$apache" = "s" ]; then
apt-get install curl
apt-get install apache2
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
touch /etc/adm/modulo/apache
service apache2 restart
else
sleep 0.1s
 fi
fi
#Apache2#
;;
6)
dropb-inst
break
;;
7)
cd
screen python proxy2.py
break
;;
8)
cd
screen python proxy53.py
break
;;
9)
mas
break
;;
10)
wget https://raw.githubusercontent.com/scriptmsc/scriptmsc/mscvip/openvpn-install.sh && chmod +x openvpn-install.sh && ./openvpn-install.sh
break
;;

*)
sleep 0.1s
;;
esac
done
exit
