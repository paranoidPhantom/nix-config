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
    rustup
    nodejs_26
    vtsls
  ];
  formulae = [ "zsh-autocomplete" "opencode" "pnpm" ];
  casks = [ "ghostty" "secretive" "bitwarden" "zen" "Roblox" "rectangle" "stats" "telegram" "vlc" "transmission" "happ" "cleanshot" "obsidian" "gimp" "kontur-talk" "zed" "obs" "handbrake" ];
}
