{ pkgs, lib, config, ... }:

{
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      (nvim-treesitter.withPlugins (p: with p; [
        p.lua
        p.nix
        p.ruby
        p.rust
        p.javascript
        p.html
        p.css
        p.scss
      ]))
      # which-key-nvim
      # nvim-web-devicons
      nvim-lspconfig
      mini-nvim
    ];

    extraPackages = with pkgs; [
      lua-language-server

      ripgrep
    ];

    # extraLuaConfig = ''
    #   vim.g.mapleader = " "

    #   require("lazy").setup({
    #     spec = {
    #       { import = "plugins" },
    #     },

    #     defaults = {
    #       lazy = false,
    #     },

    #     install = {
    #       missing = false, -- never auto-clone
    #     },

    #     dev = {
    #       path = "${packDir}",
    #       fallback = false,
    #     },

    #     rocks = {
    #       enabled = false,
    #     },
    #   })
    # '';
  };

  # xdg.configFile."nvim" = {
  #   recursive = true;
  #   source = ./config;
  # };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nix-darwin/home-manager/neovim/config";
  };
}
