{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { ... }@inputs: with inputs; let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.runCommand "test" {} ''
      echo start
      ${pkgs.coreutils}/bin/sleep 10
      echo end
      touch $out
    '';
  };
}
