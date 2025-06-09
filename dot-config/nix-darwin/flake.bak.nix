{
  description = "Indigo Gabbro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages =
        [
          pkgs.vim
          pkgs.direnv
          pkgs.htop
          pkgs.git
          pkgs.wget
          pkgs.curl
        ];
      nixpkgs.hostPlatform = "aarch64-darwin";
      nix.useDaemon = true;
      nix.settings.experimental-features = "nix-command flakes";
      nix.configureBuildUsers = true;
      services.nix-daemon.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;

      programs.zsh.enable = true;
      # programs.fish.enable = true;
      # security.pam.enableSudoTouchIdAuth = true;
      # users.users.dust.home = "/Users/dust";
      # home-manager.backupFileExtension = "backup";

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.LoginwindowText = "Jelly Labs Limited";
        screencapture.location = "~/Desktop";
        screensaver.askForPasswordDelay = 10;
      };

      # Homebrew needs to be installed on its own!
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

      environment.systemPackages =
        [
          pkgs.vim
          pkgs.curl
          pkgs.git
          pkgs.htop
          pkgs.bun
          pkgs.fish
        ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#alpha
    darwinConfigurations."alpha" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
