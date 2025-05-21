{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    system = "x86_64_linux";
  in 
  {
    inherit system;

  	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { 
        unstable-pkgs = inputs.nixpkgs-unstable.legacyPackages."${system}";
      };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
