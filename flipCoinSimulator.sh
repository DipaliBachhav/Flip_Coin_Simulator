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

#Triplet Combination
HHH=0
HHT=0
THH=0
HTH=0
THT=0
TTT=0
TTH=0
HTT=0
flipCoin=10
count=0
declare -A triplet
while [ $count -lt $flipCoin ]
do
        coin1=$(( RANDOM%2 ))
        coin2=$(( RANDOM%2 ))
	coin3=$(( RANDOM%2 ))

                if [[ $coin1 -eq 1 && $coin2 -eq 1 && $coin3 -eq 1 ]]
                then
                        (( HHH++ ))

                elif [[ $coin1 -eq 1 && $coin2 -eq 1 && $coin3 -eq 0 ]]
		then
                        (( HHT++ ))

                elif [[ $coin1 -eq 1 && $coin2 -eq 0 && $coin3 -eq 1 ]]
                then
                        (( HTH++ ))

		elif [[ $coin1 -eq 0 && $coin2 -eq 1 && $coin3 -eq 1 ]]
                then
                        (( THH++ ))

    		elif [[ $coin1 -eq 0 && $coin2 -eq 1 && $coin3 -eq 0 ]]
                then
                        (( THT++ ))

    		elif [[ $coin1 -eq 1 && $coin2 -eq 0 && $coin3 -eq 0 ]]
                then
                        (( HTT++ ))

		elif [[ $coin1 -eq 0 && $coin2 -eq 0 && $coin3 -eq 1 ]]
                then
                        (( TTH++ ))

                else
                        (( TTT++ ))
                fi
(( count++ ))
done
triplet[0]=$HHH
triplet[1]=$HHT
triplet[2]=$HTH
triplet[3]=$THH
triplet[4]=$THT
triplet[5]=$TTT
triplet[6]=$TTH
triplet[7]=$HTT

echo "Keys := ${!triplet[@]}" " Values := ${triplet[@]}"

per_HHH=$((($HHH*100)/10))
per_HHT=$((($HHT*100)/10))
per_HTH=$((($HTH*100)/10))
per_THH=$((($THH*100)/10))
per_THT=$((($THT*100)/10))
per_TTT=$((($TTT*100)/10))
per_TTH=$((($TTH*100)/10))
per_HTT=$((($HTT*100)/10))

echo "Singlet Sorting :="
sort -n <(printf "%s\n" "${dictionary[@]}")
echo "Doublet Sorting :="
sort -n <(printf "%s\n" "${doublet[@]}")
echo "Triplet Sorting :="
sort -n <(printf "%s\n" "${triplet[@]}")
