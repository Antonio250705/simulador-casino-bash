#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function ctrl_c () {
echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
exit 1
}

# ctrl+C
trap ctrl_c INT

function helpPanel (){
echo -e "\n${yellowColour}[!]${endCOlour} Uso:${purpleColour} $0${endColour}\n"
echo -e "\t${blueColour}-m)${endColour}${grayColour} Dinero con el que se desea jugar${endColour}\n"
echo -e "\t${blueColour}-t)${endColour}${grayColour} tecnica a utilizar (martingala/inverseLabrouchere${endColour}\n "
exit 1
}

function martingala(){
echo -ne "\n${yellowColour}[+]${endColour}${grayColour}Dinero actual: $money euros${endColour}"

echo -ne "${yellowColour}[+]${endColour}${grayColour}¿Cuanto dinero tienes pensado apostar? ->${endColour} " && read initial_bet
echo -ne "${yellowColour}[+]${endColour}${grayColour}¿A que desea apostar continuamente (par/impar? ->${endColour}" && read par_impar

echo -ne "${yellowColour}[+]${endColour}${grayColour}Vamos a jugar una cantidad inicial de $initial_bet euros a $par_impar${endColour}"

backup_bet=$initial_bet
play_counter=1
jugadas_malas="[ "

tput civis #para ocultar culsor
while true; do
money=$(($money-$initial_bet))
#    echo -e "\n${yellowolour}[+]${endColour}${grayColour} Acabas de apostar $initial_bet euros y tienes $money euros${endColour}"
random_number="$(( $RANDOM % 37))"
#    echo -e "\n${yellowColour}[+]${endColour} Ha salido el número ${blueColor}$ra
#    ndom_number${endColour}"

if [ ! "$money" -le 0 ]; then
if [ "$par_impar" == "par" ]; then
if [ "$((random_number %2))" -eq 0 ]; then
if [ "$random_number" -eq 0 ]; then
#       echo "[+]Ha salido el 0, por tanto perdemos"
initial_bet=$((initial_bet*2))
jugadas_malas+="$random_number "
else
#        echo -e "${blueColour}[+]${endColour}${grayColour}El numero que ha salido es par,${redColour}¡¡GANAS!!${endColour}${endColour}"
reward=$((initial_bet*2))
#        echo -e "${blueColour}[+]${endColour}${grayColour}Ganas un total de $reward euros${endColour}"
money=$(($money+$reward))
#        echo -e "${blueColour}[+]${endColour}${grayColour}Tienes $money euros${endColour}"
initial_bet=$backup_bet
jugadas_malas=""
fi
else
#     echo -e "${blueColour}[+]${endColour}${grayColour} El numero q ha salido es impar,${redColour}¡¡PIERDES!!${endColour}${endColour}"
initial_bet=$((initial_bet*2))
jugadas_malas+="$random_number "
#     echo -e "${blueColour}[+]${endColour}${grayColour}Ahora mismo te quedas en $money${endColour}"
fi

fi
else
#nos quedamos sin dinero
if [ "$money" -le 0 ]; then
echo -e "\n${redColour} [+] Te has quedado sin dinero${endColour}\n"
echo -e "[+]${grayColour} Han habido un total de $play_counter jugadas ${endColour}"
echo -e "\n${yellowColour}[+]${endColour}${grayColour}Se representan las jugadas malas que han salido${endColour}\n"
echo -e "\n${blueColour}$jugadas_malas  ${endColour}\n"
tput cnorm; exit 0
fi
fi
let play_counter+=1
done

tput cnorm #recuperar cursor
}

while getopts "m:t:h" arg;do
case $arg in
m) money=$OPTARG;;
t) technique=$OPTARG;;
h) helpPanel;;
esac
done

if [ $money ] && [ $technique ]; then
if [ "$technique" == "martingala" ]; then
martingala
else
echo -e "\n${redColour}[!] La tecnica introducida no existe${endColour}"
helpPanel
fi
else
helpPanel
fi
