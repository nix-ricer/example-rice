{
  # If you intend to include nixos system configuration, use this flake, otherwise start your flake using only the contents of the ./home directory.
  # Don't include any system configuration unique to your own system in your rice module.

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-ricer.url = "github:nix-ricer/nix-ricer";
    nix-ricer.inputs.nixpkgs.follows = "nixpkgs";
    nix-ricer.inputs.home-manager.follows = "home-manager";

  };

  outputs = { self, nixpkgs, home-manager, nix-ricer, ... }: {

    nixosModules.default = ./. self;
    homeManagerModules.default = ./home self;

  };
}
