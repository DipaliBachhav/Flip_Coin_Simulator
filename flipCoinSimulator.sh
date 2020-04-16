#!/bin/bash -x
echo "Flip Coin Simulator"

declare -A dictionary
HEAD=0
TAIL=1
random=$((RANDOM%2))
if [ $random -eq $HEAD ]
then
	echo "Head"
else
        echo "Tail"
fi

function combination(){
        for (( i=0; i<$1; i++ ))
        do
                coin=""
      for (( j=0; j<$2; j++ ))
      do
         random=$((RANDOM%2))
         if [ $random -eq $HEAD ]
         then
            coin+=H
         else
            coin+=T
         fi
                done
      dictionary[$coin]=$(( ${dictionary[$coin]}+1 ))
        done
   echo "Combination : ${dictionary[@]}"
   echo  "keys : ${!dictionary[@]}"
}


function percentageFind(){
   for key in ${!dictionary[@]}
   {
      percentage=$((${dictionary[$keys]}))/$flipCoin*100
      echo  "$key =  $percentage"
   }
}
read -p "Enter How Many Time Coin Flip := " flipCoin
read -p "1)Singlet Combination 2)Doublet Combination 3)Triplet Combination " choice

# Check choice
if [ $choice -eq 1 ]
then
   combination $flipCoin $choice
   percentageFind
elif [ $choice -eq 2 ]
then
   combination $flipCoin $choice
   percentageFind
elif [ $choice  -eq 3 ]
then
   combination $flipCoin $choice
   percentageFind
else
   echo "Invalid Choice..."
fi

# sort in desending order
for key in ${!dictionary[@]}
do
        echo -n " $key ${dictionary[$key]}"
done
sort -n <(printf "%s\n" "${dictionary[$coin]}")
