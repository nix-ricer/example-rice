{

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-ricer.url = "github:nix-ricer/nix-ricer";
    nix-ricer.inputs.nixpkgs.follows = "nixpkgs";
    nix-ricer.inputs.home-manager.follows = "home-manager";

  };

  outputs = { self, nixpkgs, home-manager, nix-ricer, ... }: {

    homeManagerModules.rice = ./home self;
    homeManagerModules.default = self.homeManagerModules.rice;

  };

}
