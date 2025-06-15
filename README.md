SETUP INSTRUCTIONS
==================
## Moving to Nix-Dawin / Home-Manager based dotfiles management
[https://git.lix.systems/lix-project/lix-installer](ref:install-lix)

### Phase 1: Install Nix (via Lix)
`curl --proto '=https' --tlsv1.2 -sSf -L https://install.lix.systems/lix | sh -s -- install && which nix`

### Phase 2: Install Nix-Darwin
[https://github.com/nix-darwin/nix-darwin#readme](ref:nix-darwain)
> Note: using -vvv will output with the highest level of verbosity (which is great information to have during setup) and you should discontinue use after setup has completed.

#### Need to program some ENV vars:

##### Alpha
TARGET_FLAKE_ALPHA="alpha.flake.nix"
TARGET_CONFIG_ALPHA="alpha.configuration.nix"

##### Omega
TARGET_FLAKE_OMEGA="omega.flake.nix"
TARGET_CONFIG_OMEGA="omega.configuration.nix"





`sudo mkdir -p /etc/nix-darwin`
`sudo chown $(id -nu):$(id -ng) /etc/nix-darwin`

sudo cp ~/..dot-files/dot-config/nix-darwin/$TARGET_CONFIG_NIX


`cd /etc/nix-darwin`
`sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix`

`sudo nix run nix-darwin/master#darwin-rebuild -- switch -vvv` 
`sudo darwin-rebuild switch -vvv` 

### Installing Home-Manager 
> Important: this is specific to installation that resides on top of Nix-Dawin, which varies significantly from an installation residing directly on top of Nix

> https://nix-community.github.io/home-manager/#sec-install-nix-darwin-module
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update


---
## OLD - for Stow based dotfile management

### Refrence:
https://www.gnu.org/software/stow/manual/stow.html
https://github.com/omerxx/dotfiles
duck://player/y6XCebnB9gs

### OLD Tasks (for Stow based dotfile management)
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
