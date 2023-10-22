#!/bin/bash
#recode from massgitscan.sh github.com/adelittle
#Svn Scanner 
# Colors
cRojo=`tput setaf 1`
cVerde=`tput setaf 2`
cAmarillo=`tput setaf 3`
cAzul=`tput setaf 4`

# Effects
cBold=`tput bold`
cNormal=`tput sgr0` #No color, No bold

LISTS=$1

echo "================================= Mass Scanner for ${cBold}${cAmarillo}.svn${cNormal} Folder ===================================="
echo " ███╗   ███╗ █████╗ ███████╗███████╗    ███████╗ ██████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗  "
echo " ████╗ ████║██╔══██╗██╔════╝██╔════╝    ██╔════╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗ "
echo " ██╔████╔██║███████║███████╗███████╗    ███████╗██║     ███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝ "
echo " ██║╚██╔╝██║██╔══██║╚════██║╚════██║    ╚════██║██║     ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗ "
echo " ██║ ╚═╝ ██║██║  ██║███████║███████║    ███████║╚██████╗██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║ "
echo " ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ "
echo "====================================== ${cBold}By ${cBold}${cRojo}Sultan Rizky${cNormal} ============================================"

if [[ ! -f ${LISTS} ]]; then
	echo "ERROR: ${LISTS} not found"
	echo "usage: bash $0 list.txt"
	exit
fi

for SITE in $(cat $LISTS);
do

    if [[ $(curl --connect-timeout 3 --max-time 3 -kLs "${SITE}/.git/" ) =~ 'wc.db' ]]; then
		echo "[+] VULN: ${SITE}"
	else :
	fi
    
done
