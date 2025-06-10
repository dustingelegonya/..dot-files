#!/usr/bin/env zsh
### TODO
# Applications
# Desktop -> /Users/indigo/Library/Mobile Documents/com~apple~CloudDocs/Desktop
# Documents -> /Users/indigo/Library/Mobile Documents/com~apple~CloudDocs/Documents
# Downloads -> /Users/indigo/Library/Mobile Documents/com~apple~CloudDocs/Downloads
# iCloud -> /Users/indigo/Library/Mobile Documents/com~apple~CloudDocs
# Movies -> /Users/indigo/Library/Mobile Documents/com~apple~CloudDocs/Movies
# Music -> /Users/indigo/Library/Mobile Documents/com~apple~CloudDocs/Music
# Pictures -> /Volumes/Personal-Drive/pictures

ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/@icloud-drive
ln -s /Volumes/Personal-Drive $HOME/@personal-drive
# ln -s /Volumes/Personal-Drive/pictures $HOME/@pictures
