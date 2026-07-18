{
  description = "Neovim dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs:
    let
      supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwing"];

      # Helper to apply pkgs to all systems
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs {inherit system;}));
    in {
      packages = forAllSystems (
        pkgs: let
          pkglist = with pkgs; [
            lua-language-server
            vscode-langservers-extracted
            emmet-language-server
            rust-analyzer
            prettier
            black
            rustfmt
            typescript-language-server
            tailwindcss-language-server
            stylua
            nixd

            lua5_1
            tree-sitter
            ripgrep
            gcc
            fzf
            gnumake
            imagemagick
            luarocks
          ];
        in {
          default = inputs.wrappers.wrappers.neovim.wrap {
            inherit pkgs;
            env = {
              "CONFIG_ROOT" = ./.;
              "NVIM_APPNAME" = "nvim-blw-remote";
            };
            runtimePkgs = with pkgs; [
              lua5_1
              tree-sitter
              ripgrep
              gcc
              fzf
              luarocks
            ];
            settings.config_directory = ./.;
          };
        }
      );
    };
}
