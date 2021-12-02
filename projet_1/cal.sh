#!/bin/bash

#let -x

echo -e "\nBienvenue dans la calculatrice d'Anthony Leblanc,\n\n";

test_continue="Y"

while [ $test_continue = "Y" ]
do

	echo -e "\n\nVeuillez saisir les paramètres de l'opération dans le format : \"a opérateur b = ans\"\n";
	read -p "a = " a
	echo -e "\nLes opérateurs possiblent sont les suivants : +-*/"
	read -p "opérateur = " operateur
	echo;
	read -p "b = " b

	case $operateur in
		"+")
			let "ans=a+b"
			echo "$a + $b = $ans";
			;;
		"-")
			let "ans=a-b"
			echo "$a - $b = $ans";
			;;
		"*")
			let "ans=a*b"
			echo "$a * $b = $ans";
			;;
		"/")
			if [ $b -ne 0 ]
			then
				ans=`echo $a/$b | bc -l`
				echo "$a / $b = $ans";
			else
				echo "Depuis quand tu divises par 0 toi ?"
			fi
			;;
		*)
			echo -e "\nVous n'avez pas tapez un opérateur accepté;Les opérateurs acceptés sont : +-*/\n";

	esac

	echo -e "\nVoulez-vous effectuer d'autres calculs ? [Y/n]\n"
	read test_continue

	if [ $test_continue = "y" ]
	then
		test_continue="Y"
		echo -e "\n\n"
	fi

done
