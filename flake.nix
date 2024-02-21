{
  description = "My system";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows =
        "nixpkgs"; # Use system packages list where available
    };

    nil.url = "github:oxalica/nil/2023-08-09";
  };

  outputs = { self, nixpkgs, home-manager, nix-index-database, ... }@inputs: {
    nixosConfigurations."aesthetic" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        home-manager.nixosModules.home-manager
        nix-index-database.nixosModules.nix-index
        { programs.nix-index-database.comma.enable = true; }
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users = {
                koehn = import ./home/default.nix;
              };
            };
          }
      ];
    };
  };
}
