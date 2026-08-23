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
    bun
    rust-analyzer
    cargo
    rustc
  ];
  formulae = [ "zsh-autocomplete" ];
  casks = [ "ghostty" "secretive" "bitwarden" "zen" "Roblox" "rectangle" "stats" "telegram" "vlc" ];
}
