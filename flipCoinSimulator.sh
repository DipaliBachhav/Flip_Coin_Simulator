#!/bin/bash -x
echo "Flip Coin Simulator"
#Singlet Combination
declare -A dictionary
for ((i=0; i<=10; i++ ))
do
coin=$((RANDOM%2))
if [[ $coin -eq 1 ]]
then
	((head++))
else
	((tail++))
fi
done
dictionary[0]=$head
dictionary[1]=$tail

echo "${dictionary[@]}"
per_Head=$(( ($head*100)/10 ))
per_Tail=$(( ($tail*100)/10 ))

#Doublet Combination
HH=0
HT=0
TT=0
TH=0
flipCoin=10
count=0
declare -A doublet
while [ $count -lt $flipCoin ]
do
	coin1=$(( RANDOM%2 ))
	coin2=$(( RANDOM%2 ))
		if [[ $coin1 -eq 1 && $coin2 -eq 1 ]]
		then
			(( HH++ ))
		elif [[ $coin1 -eq 1 && $coin2 -eq 0 ]]
                then
                        (( HT++ ))

		elif [[ $coin1 -eq 0 && $coin2 -eq 1 ]]
                then
                        (( TH++ ))
		else
			(( TT++ ))
		fi
(( count++ ))
done

doublet[0]=$HH
doublet[1]=$HT
doublet[2]=$TH
doublet[3]=$TT

echo "${doublet[@]}"

per_HH=$((($HH*100)/10))
per_HT=$((($HT*100)/10))
per_TH=$((($TH*100)/10))
per_TT=$((($TT*100)/10))
