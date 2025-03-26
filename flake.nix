{
  description = "Hyprland setup for Arch with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixgl.url = "github:guibou/nixGL";  # Untuk akses GPU di Arch
  };

  outputs = { self, nixpkgs, nixgl }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      nixgl-pkgs = nixgl.packages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          nixgl-pkgs.nixGLMesa  # Gunakan ini untuk Intel/AMD
          # nixgl-pkgs.nixGLNvidia  # Gunakan ini untuk NVIDIA
          pkgs.hyprland
          pkgs.waybar
          pkgs.wofi
          pkgs.swaylock
          pkgs.foot
          pkgs.grim
          pkgs.slurp
          pkgs.mako
        ];
      };
    };
}
