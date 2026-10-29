{ pkgs, ... }: {
  packages = with pkgs; [
    /* Core */
    git
    ripgrep
    zoxide
    fastfetch
    tmux

    /* TUI */
    neovim
    lazygit
    glow

    /* Misc */
    ffmpeg
    desktoppr
    gh

    /* Webdev */
    bun
    nodejs_24
    vtsls

    /* Rust */
    rustup
    bacon

    /* Haskell */
    ghc
    haskell-language-server
  ];
  formulae = [ "zsh-autocomplete" "pnpm" "riscv-software-src/riscv/riscv-tools" ];
  casks = [ "ghostty" "secretive" "bitwarden" "zen" "Roblox" "rectangle" "stats" "telegram" "vlc" "transmission" "happ" "cleanshot" "obsidian" "gimp" "kontur-talk" "zed" "obs" "handbrake" "zoom" "discord" "google-chrome" "yandex" "libreoffice" "steam" ];
}
