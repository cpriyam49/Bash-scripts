#!/bin/bash

if [ ! -d ~/Downloads/Music ]; then
    mkdir -p ~/Downloads/Music
fi

cd ~/Downloads/Music || return

# get output format
# pass these as values - vorbis,mp3,m4a,wav
format=vorbis
if [ "$2" ]; then
	format=$2
fi
# download
if hash aria2c 2> /dev/null; then
  youtube-dl --prefer-ffmpeg -f 171/251/140/bestaudio --extract-audio --audio-format "$format" --audio-quality 0 --external-downloader aria2c "$1"
else
  youtube-dl --prefer-ffmpeg -f 171/251/140/bestaudio --extract-audio --audio-format "$format" --audio-quality 0 "$1"
fi
