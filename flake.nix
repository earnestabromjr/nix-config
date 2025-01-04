{
  description = "Home manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, hyprland, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    homeConfigurations = {
      terrya = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules =
        [
          ./home.nix
        ];
      };
    };
  };
}
