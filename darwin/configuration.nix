{ pkgs, ... }: {
  system.defaults = {
    # Global OS behaviors
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleIconAppearanceTheme = "ClearAutomatic";
    };

    # Dock preferences
    dock = {
      autohide = true;
      orientation = "bottom";
      show-recents = false;
      minimize-to-application = false;
    };

    # Finder preferences
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
    };
  };

  # Homebrew preferences
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    casks = [ "ghostty" "secretive" "bitwarden" "zen" "Roblox" ];
  };

  # Sudo with Touch ID
  security.pam.services.sudo_local.touchIdAuth = true;
}
