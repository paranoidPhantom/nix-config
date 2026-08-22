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

  # zoxide
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # desktoppr
  programs.desktoppr = {
    enable = true;
    settings = {
      picture = "https://media.512pixels.net/downloads/macos-wallpapers-6k/26-Tahoe-Beach-Night.png";
    };
  };

  # zsh
  programs.zsh = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      cd = "z";
      c = "clear";
      ls = "ls -lAFGt | less";
      ga = "git add $1";
      gc = "git commit --edit";
      gch = "git checkout";
      gp = "git push";
      gs = "git status";
      nx = "nix develop";
    };
    autosuggestion = {
      enable = true;
    };
    initContent = ''
      clear

      # Launch editor for command
      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey '^x^e' edit-command-line

      # Fetch
      [[ -n ''${TMUX:-} ]] || fastfetch --logo NixOS;
    '';
  };

  # Lazygit
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          activeBorderColor = [
            "#b4befe"
            "bold"
          ];
          inactiveBorderColor = [
            "#a6adc8"
          ];
          optionsTextColor = [
            "#b4befe"
          ];
          selectedLineBgColor = [
            "#313244"
          ];
          cherryPickedCommitBgColor = [
            "#45475a"
          ];
          cherryPickedCommitFgColor = [
            "#b4befe"
          ];
          unstagedChangesColor = [
            "#f38ba8"
          ];
          defaultFgColor = [
            "#cdd6f4"
          ];
          searchingActiveBorderColor = [
            "#f9e2af"
          ];
          lightTheme = false;
        };

        authorColors = {
          "*" = "#b4befe";
        };
      };
    };
  };

  # omz
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "bun"
      "rust"
      "docker"
      "macos"
      "nvm"
      "npm"
      "docker-compose"
    ];
    custom = ".config/zsh/oh-my-zsh-custom";
    theme = "robbyrussell";
  };

  # zsh-autocomplete
  xdg.configFile."zsh/oh-my-zsh-custom" = {
    source = pkgs.fetchFromGitHub {
      owner = "marlonrichert";
      repo = "zsh-autocomplete";
      rev = "027cdab14451e98c9d36d72b1f79d9488ac88e46";
      hash = "sha256-1GaGIOPZ/+DrwHodFB9ZgSy5RcJWIcjYj5edYMUWOuA="; # build and get the hash from the error
      postFetch = ''
        rm $out/run-tests.zsh
      '';
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

  # TODO: refactor to home-manager
  home.file = {
    ".tmux.conf" = {
      source = ../.tmux.conf;
    };
  };

  # Ghostty
  # TODO: refactor to home-manager
  xdg.configFile."ghostty/config" = {
    source = ../ghostty;
  };

  # SSH
  # TODO: refactor to home-manager
  home.file = {
    ".ssh" = {
      source = ../ssh;
      recursive = true; # Keeps directory structure intact
    };
  };
}
