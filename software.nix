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
    nodejs_24
    vtsls
    bacon
  ];
  formulae = [ "zsh-autocomplete" "pnpm" "riscv-software-src/riscv/riscv-tools" "mdv" ];
  casks = [ "ghostty" "secretive" "bitwarden" "zen" "Roblox" "rectangle" "stats" "telegram" "vlc" "transmission" "happ" "cleanshot" "obsidian" "gimp" "kontur-talk" "zed" "obs" "handbrake" "zoom" "discord" "helium-browser" "yandex" "libreoffice" ];
}
