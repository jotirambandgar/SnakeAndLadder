#! /bin/bash -x

NO_PLAY=0
LADDER=1
SNAKE=2

function startPlaying(){
	local	rollDieNum=0
	local playerPosition=0

	while [ $playerPosition -lt 100 ]
	do
		local die=$(( RANDOM % 6 + 1))
		local option=$((RANDOM%3))
		case $option in
			$NO_PLAY)
						((rollDieNum++)) ;;
			$LADDER)
					if [ $(($playerPosition + $die)) -le 100 ]
					then
						playerPosition=$(( $playerPosition + $die ))
					fi 
					((rollDieNum++));;
			$SNAKE)
					if [ $die -lt $playerPosition ]
					then
				 		playerPosition=$(( $playerPosition - $die ))
					fi 
					((rollDieNum++));;
		esac
	#echo "die$rollDieNum : $playerPosition "
	done
	echo $rollDieNum
}

function main(){
	player1DieCount=$(startPlaying)
	player2DieCount=$(startPlaying)
	if [ $player1DieCount -lt $player2DieCount ]
	then
			echo "player 1 win"
	else
			echo "player 2 win"
	fi
}

main
