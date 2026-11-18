{ pkgs, ... }: {
  packages = with pkgs; [
    /* Core */
    git
    ripgrep
    zoxide
    fastfetch
    tmux
    moor

    /* TUI */
    neovim
    lazygit
    glow

    /* Misc */
    ffmpeg
    desktoppr
    gh
    todoist-cli
    rtk

    /* Webdev */
    bun
    vtsls

    /* Rust */
    rustup
    bacon

    /* Haskell */
    ghc
    haskell-language-server
  ];
  formulae = [ "zsh-autocomplete" "pnpm" "node" ];
  casks = [ "ghostty" "secretive" "bitwarden" "zen" "Roblox" "rectangle" "stats" "telegram" "vlc" "transmission" "happ" "cleanshot" "obsidian" "gimp" "kontur-talk" "zed" "obs" "handbrake-app" "zoom" "discord" "google-chrome" "yandex" "libreoffice" "steam" "spotify" "TheBoredTeam/boring-notch/boring-notch" "ngrok" "yandextelemost" ];
}
