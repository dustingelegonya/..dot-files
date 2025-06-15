SETUP INSTRUCTIONS
==================
> https://www.gnu.org/software/stow/manual/stow.html
> https://github.com/omerxx/dotfiles
> duck://player/y6XCebnB9gs

- [ ] - Backup current configs
`./..dot-files/dot-bin/run-backup.sh`
- [ ] - Run intsall
`./..dot-files/dot-bin/run-init.sh`
- [ ] - Istall Fonts
`cp ~/.fonts/Agave/*.ttf ~/Library/Fonts/`
- [ ] - Confirm Installation & Copy font family name
`osascript -e 'tell application "Font Book" to activate'`
- [ ] - Install starship theme
`starship preset gruvbox-rainbow -o $HOME/.config/starship.toml`
- [ ] - Install Brews
`./.bin/run-brew-installs.sh`
- [ ] - Create ssh keys and upload to github
`ssh-keygen`
- [ ] - Upload to github
`https://github.com/settings/keys`
- [ ] - Install Volta
`~/.bin/run-install-volta.sh`

## Setting up Home Manager via Nix-Darwin
> https://nix-community.github.io/home-manager/#sec-install-nix-darwin-module
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
