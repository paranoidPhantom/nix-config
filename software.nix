{ pkgs, ... }: {
  packages = with pkgs; [
    git
    ripgrep
    neovim
    gh
    tmux
    zoxide
    fastfetch
    lazygit
    desktoppr
    ffmpeg
  ];
  formulae = [ "zsh-autocomplete" ];
  casks = [ "ghostty" "secretive" "bitwarden" "zen" "Roblox" "rectangle" "stats" "telegram" "vlc" ];
}
