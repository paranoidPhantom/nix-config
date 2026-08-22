{ pkgs, username, ... }:

{
  # Mandatory options
  home.username = username;
  home.stateVersion = "26.05"; 

  # Packages to install in your user environment
  home.packages = (import ../software.nix { pkgs = pkgs; }).packages;

  # Configuration managed directly by Home Manager
  programs.git = {
    enable = true;
    settings.user = {
      name = "Andrei B Hudalla";
      email = "andrei@hudalla.dev";
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Neovim
  xdg.configFile."nvim" = {
    source = ../nvim;
    recursive = true; # Keeps directory structure intact
  };

  # tmux
  xdg.configFile."tmux/plugins/catppuccin/tmux" = {
    source = builtins.fetchGit {
      url = "https://github.com/catppuccin/tmux.git";
      ref = "refs/tags/v2.3.0";
      rev = "d2d25bd3393fe43f19eb4fff6cdd2bdf5578e622"; 
    };
  };

  home.file = {
    ".ssh" = {
      source = ../ssh;
      recursive = true; # Keeps directory structure intact
    };
  };
  home.file = {
    ".tmux.conf" = {
      source = ../.tmux.conf;
    };
  };
}
