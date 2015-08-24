# easy-listening-for-vagrant

Easy Listening for Vagrant is a simple bash script for OSX that plays jazzy music on "vagrant up." That's it.

It was made in an afternoon at MediaMath's annual Hack-a-thon. It was my first bash script of any significant length, and I'm certain I've done some non-idiomatic things, so feel free to comment or send a PR if something looks incorrect.

Easy Listening is currently OSX-only, as it requires the mac-only utility afplay.

To install it, you'll need to clone the repository and add a file called "music.mp3" to the same directory that contains the script. Pick a valid MP3 of your choosing. I used [this track](https://www.jamendo.com/en/track/990734/jazz-masterpieces-good-old-swing-006), which is CC-licensed and available for free on Jamendo.

Next, add a call to the script. I did this in my ~/.bashrc. (You'll need to replace that path with the actual file path.) 
```bash
source path/to/shellscript/easylistening.sh
alias vagrant=play_music
```

And that should to it!
