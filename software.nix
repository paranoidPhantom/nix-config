{ pkgs, ... }: {
  # Nix packages
  packages = with pkgs; [
    # Core CLI
    git
    ripgrep
    zoxide
    fastfetch
    tmux
    moor

    # TUI
    neovim
    lazygit
    glow
    podman-tui

    # Utilities
    ffmpeg
    desktoppr
    gh
    todoist-cli
    rtk
    podman
    whisper-cpp

    # Web development
    bun
    vtsls

    # Rust
    rustup
    bacon

    # Haskell
    ghc
    haskell-language-server
  ];

  # Homebrew formulae
  formulae = [
    # Shell
    "zsh-autocomplete"

    # Development
    "opencode"
    "pnpm"

    # Maintenance
    "mac-cleanup-go"
  ];

  # Homebrew casks
  casks = [
    # Development
    "ghostty"
    "zed"
    "obs"

    # Browsers
    "zen"
    "google-chrome"
    "yandex"

    # Security
    "secretive"
    "bitwarden"

    # Communication
    "telegram"
    "discord"
    "zoom"
    "kontur-talk"
    "yandextelemost"

    # Productivity
    "obsidian"
    "rectangle"
    "stats"
    "cleanshot"
    "happ"
    "TheBoredTeam/boring-notch/boring-notch"

    # Media
    "vlc"
    "transmission"
    "gimp"
    "handbrake-app"
    "libreoffice"

    # Misc
    "Roblox"
  ];
}
