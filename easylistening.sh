if [ "$1"=="up" ]
   then
   SOURCE="${BASH_SOURCE[0]}"
   while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	   DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	   SOURCE="$(readlink "$SOURCE")"
	   [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
   done
   DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
   musicfile=$DIR/2.mp3
   echo $file
   afplay $musicfile > /dev/null 2>&1 &
   player_pid=$!

   vagrant $@
   kill $player_pid
   wait $player_pid 2>/dev/null
   afplay /System/Library/Sounds/Glass.aiff
else
	foo $@
fi
