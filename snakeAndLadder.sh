#! /bin/bash -x

NO_PLAY=0
LADDER=1
SNAKE=2

playerPosition=0

function startPlaying(){
	while [ $playerPosition -le 100 ]
	do
		die=$(( RANDOM % 6 + 1))
		option=$((RANDOM%3))

		case $option in
			$NO_PLAY)
					echo "no play" ;;
			$LADDER)
					playerPosition=$(( $playerPosition + $die )) ;;
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
