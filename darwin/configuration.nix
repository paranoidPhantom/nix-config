{ pkgs, ... }: {
  # Power
  power.sleep.display = 60;

  system.defaults = {
    # Global OS behaviors
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleIconAppearanceTheme = "RegularDark";
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleTemperatureUnit = "Celsius";
    };

    # Window management
    WindowManager = {
      StandardHideWidgets = true;
      StandardHideDesktopIcons = true;
      EnableStandardClickToShowDesktop = false;
      EnableTilingByEdgeDrag = false;
    };

    # Dock preferences
    dock = {
      autohide = true;
      orientation = "bottom";
      show-recents = false;
      minimize-to-application = false;
      tilesize = 10;
    };

    # Finder preferences
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
    };

    controlcenter.BatteryShowPercentage = false;
    menuExtraClock.IsAnalog = true;
  };

  # Homebrew preferences
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    brews = (import ../software.nix { pkgs = pkgs; }).formulae;
    casks = (import ../software.nix { pkgs = pkgs; }).casks;
  };

  # Sudo with Touch ID
  security.pam.services.sudo_local.touchIdAuth = true;
}
