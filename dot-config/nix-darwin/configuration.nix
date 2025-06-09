# configuration.nix
{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.vim
    pkgs.direnv
    pkgs.htop
    pkgs.git
    pkgs.wget
    pkgs.curl
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = "nix-command flakes";

  nix.linux-builder.enable = true;
  programs.zsh.enable = true;

  # Passwordless sudo for your user
  security.sudo.extraConfig = ''
    dust ALL=(ALL) NOPASSWD: ALL
  '';

  system.primaryUser = "dust";

  system.defaults = {
    alf.globalstate = 1;
    smb.ServerDescription = "alpha";
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.LoginwindowText = "Jelly Labs Limited";
    screencapture.location = "~/Desktop";
    screensaver.askForPasswordDelay = 10;
  };

  # Homebrew configuration
  homebrew.enable = true;
  homebrew.casks = [
    "wireshark"
    "google-chrome"
  ];
  homebrew.brews = [
    "imagemagick"
    "ffmpeg"
    "exiftool"
    "stow"
  ];
}
