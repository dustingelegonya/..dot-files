{
  description = "This configuration is specific to the machine ALPHA and the aarch64 archetecture";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }: {
    darwinConfigurations."alpha" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix  # Import the separate file
        {
          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.stateVersion = 6;
          nix.settings.trusted-users = [
            "root"
            "@staff"
          ];
        }
      ];
    };
  };
}
