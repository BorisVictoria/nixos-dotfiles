{
  description = "Quite possible THE flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    catppuccin.url = "github:catppuccin/nix";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nix-gaming.url = "github:fufexan/nix-gaming";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    yazi.url = "github:sxyazi/yazi";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    ags.url = "github:Aylur/ags";
    helix.url = "github:helix-editor/helix";
    catppuccin-vsc.url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    chaotic,
    catppuccin,
    nix-flatpak,
    anyrun,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system.packages = [anyrun.packages.${system}.anyrun];
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          chaotic.nixosModules.default
          catppuccin.nixosModules.catppuccin
          nix-flatpak.nixosModules.nix-flatpak
          {
            home-manager = {
              users = {
                doomerang = {
                  imports = [
                    ./home.nix
                    catppuccin.homeManagerModules.catppuccin
                    nix-flatpak.homeManagerModules.nix-flatpak
                  ];
                };
              };
            };
          }
        ];
      };
    };
  };
}
