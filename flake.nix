{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  outputs =
    { self, nixpkgs }:
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        modules = [
          {
            boot.isContainer = true;

            programs.nh = {
              enable = true;
              flake = /etc/nixos;
            };

            nixpkgs.hostPlatform = "x86_64-linux";
          }
        ];
      };
    };
}
