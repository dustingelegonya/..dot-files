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
      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nix.linux-builder.enable = true;
      programs.zsh.enable = true;
      # programs.fish.enable = true;
      # security.pam.enableSudoTouchIdAuth = true;
      # home-manager.backupFileExtension = "backup";
      # users.users.dust.home = "/Users/dust";
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
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#alpha
    darwinConfigurations."alpha" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        {
            nix.settings.trusted-users = [
            "root"
            "@staff"  # all in staff group
            ];

            # Alternative syntax:
            # nix.trustedUsers = [ "root" "your-username" "@wheel" ];
        }
      ];
    };
  };
}
