#!/bin/bash

salida=1
read -p "Escribe la dirección IP que quieras obtener info " ip
while [ $salida -eq 1 ]
do
	echo "Escoge una opción: "
	echo "--------------------"
	echo "1.- Realiza un ping"
	echo "2.- Realiza un traceroute"
	echo "3.- Realiza un whois"
	echo "4.- Realiza un nslookup"
	echo "5.- Realiza un escaneo. Para esta función necesitas instalar el paquete 'nmap'"
	echo "--------------------"
	echo "Algunas opciones de configuración"
	echo "6.- Configuración de red"
	echo "7.- Nombre de la máquina"
	echo "8.- Configuración de tarjeta de red"
	echo "--------------------"
	echo "Q para salir del menú"
	read opc

	case $opc in
		1)
			ping $ip
		;;

		2)
			traceroute $ip
		;;

		3)
			whois $ip
		;;

		4)
			nslookup $ip
		;;

		5)
			nmap $ip
			nmap -sN $ip
			sudo nmap -O $ip
		;;

		6)
			ifconfig
		;;

		7)
			hostname
		;;

		8)
			iwconfig
		;;

		q)
			exit 0
		;;

		*)
			echo "No has escogido ninguna función"
			exit 1
		;;
	esac
done
