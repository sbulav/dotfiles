{
  inputs,
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.lsp;
in {
  options.custom.tools.lsp = with types; {
    enable = mkBoolOpt false "Whether or not to enable lsp utilities.";
  };

  config = mkIf cfg.enable {
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    environment.systemPackages = with pkgs; [
      lua-language-server # LSP for lua
      marksman # LSP for markdown
      nixd # LSP for nix
      tree-sitter
      yamllint
      nodejs_22 # Note for LSP servers
      pyright
      black
      helm-ls
    ];
  };
}
