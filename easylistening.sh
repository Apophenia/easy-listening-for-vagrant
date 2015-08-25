#!/usr/bin/env bash

VAGRANT=vagrant

play_music() {
if [ "$1" == "up" ];
then
   # get current directory
   # this should work with symlinked directories, but is untested
   # some code here from SO question 59895
   SOURCE="${BASH_SOURCE[0]}"
   while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	   DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	   SOURCE="$(readlink "$SOURCE")"
	   [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
   done
   DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
   musicfile=$DIR/music.mp3

   # requires recent version of OSX
   (afplay $musicfile &)

   $VAGRANT $@
   (ps -ef | grep 'afplay' | head -1 | awk '{print $2}' | xargs kill)
   afplay /System/Library/Sounds/Glass.aiff
else
	$VAGRANT $@
fi
}
