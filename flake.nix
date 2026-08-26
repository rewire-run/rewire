# Published to rewire-run/rewire by .github/workflows/mirror.yaml, which is where `nix` resolves
# `github:rewire-run/rewire` from. Edit it here; the copy in the mirror is overwritten every release.
{
  description = "Drop-in ROS 2 bridge for Rerun";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = builtins.attrNames
        (builtins.fromJSON (builtins.readFile ./sources.json)).platforms;

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      overlays.default = final: prev: {
        rewire = final.callPackage ./package.nix { };
      };

      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          rewire = pkgs.callPackage ./package.nix { };
        in
        {
          inherit rewire;
          default = rewire;
        });
    };
}
