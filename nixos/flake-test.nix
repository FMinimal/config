{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      hyprland = {
        url = "github:hyprwm/Hyprland";
        # build with your own instance of nixpkgs
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = { self, nixpkgs, hyprland }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      # ...
      modules = [
        hyprland.nixosModules.default
        { programs.hyprland.enable = true; }
        # ...
      ];
    };
  };
}