#! /bin/bash -x

NO_PLAY=0
LADDER=1
SNAKE=2
playerPosition=0

function startPlaying(){
	while [ $playerPosition -lt 100 ]
	do
		local die=$(( RANDOM % 6 + 1))
		local option=$((RANDOM%3))

		case $option in
			$NO_PLAY)
					echo "no play" ;;
			$LADDER)
					if [ $(($playerPosition + $die)) -le 100 ]
					then
						playerPosition=$(( $playerPosition + $die ))
					fi ;;
			$SNAKE)
					if [ $die -lt $playerPosition ]
					then
				 		playerPosition=$(( $playerPosition - $die ))
					fi ;;
		esac
	done
	echo "$playerPosition"
}
startPlaying
echo "$playerPosition"
