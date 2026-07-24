inputs:
{
  config,
  wlib,
  lib,
  pkgs,
  options,
  ...
}:
{
  imports = [ wlib.wrapperModules.neovim ];

  config.settings.config_directory = ./.;

  config.specs.nix = {
    data = null;
    runtimePkgs = with pkgs; [
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
      nixfmt
      lua5_1
      tree-sitter
			fd
      ripgrep
      gcc
      fzf
      gnumake
      imagemagick
      luarocks
    ];
  };

  # This submodule modifies both levels of your specs
  config.specMods =
    {
      ...
    }:
    {
      options.runtimePkgs = options.runtimePkgs // {
        description = ''
          A runtimePkgs spec field to put packages on the PATH
          If the spec is disabled, this value will not be included in the resulting neovim derivation
        '';
      };
    };
  config.runtimePkgs = config.specCollect (acc: v: acc ++ (v.runtimePkgs or [ ])) [ ];

  config.envDefault = {
    "CONFIG_ROOT" = ./.;
    "NVIM_APPNAME" = "nvim-blw";
  };
}
