{
  description = "Darwin system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, mac-app-util, nix-homebrew, homebrew-core, homebrew-cask, ... }@inputs:
  let
    hostname = "Andreis-MacBook-Pro";   # replace: `scutil --get LocalHostName`
    username = "hdla";        # replace: your macOS short username
    system = "aarch64-darwin";
  in
  {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs username; };

      modules = [
        ./darwin/configuration.nix

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = username;
            enableRosetta = true;
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };
            mutableTaps = false;
          };
        }

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit username; };

          users.users.${username} = {
            name = username;
            home = "/Users/${username}";
          };

          home-manager.users.${username} = import ./home/home.nix;
        }

        {
          nixpkgs.hostPlatform = system;
          system.primaryUser = username;
          system.stateVersion = 5;
          nix.enable = false;
        }
      ];
    };

    # Convenience: `nix run .#build` or similar could go here later
  };
}
