Nix Install & Config
=========================
> https://git.lix.systems/lix-project/lix-installer

## Phase 1: Install Nix (Lix)
`curl --proto '=https' --tlsv1.2 -sSf -L https://install.lix.systems/lix | sh -s -- install && which nix`

## Phase 2: Install Nix Darwin
> https://github.com/nix-darwin/nix-darwin#readme

`sudo mkdir -p /etc/nix-darwin`
`sudo chown $(id -nu):$(id -ng) /etc/nix-darwin`
`ln -s ~/.config/nix-darwin/flake.x86.nix /etc/nix-darwin/flake.nix`

`ln -s ~/.config/nix-darwin/configuration.nix /etc/nix-darwin/configuration.nix`
- or -
`ln -s ~/.config/nix-darwin/configuration.x86.nix /etc/nix-darwin/configuration.nix`

`cd /etc/nix-darwin`
`sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix`
