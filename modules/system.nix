{ ... }: {
  nixpkgs.config.allowUnfree = true;

  # enable Touch ID and Watch ID for sudo commands
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
    reattach = true;
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true; # caps -> control
  };

  system.defaults = {
    # Mac Settings
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.ApplePressAndHoldEnabled = false;

    # Finder Settings
    finder = {
      ShowPathbar = true;
      ShowStatusBar = true;
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv"; # List view
      CreateDesktop = false; # Disable desktop items
      NewWindowTarget = "Home";
    };

    # Dock Settings
    dock = {
      autohide = true;
      autohide-delay = 0.0; # No delay for showing dock
      show-recents = false; # Don't show recent apps
      minimize-to-application = true; # Minimize apps into their icon
      showhidden = true; # Make hidden apps' icons translucent
      mineffect = "scale"; # Minimize effect set to scale
      magnification = true; # Magnify icons
      tilesize = 64;
    };

    # Trackpad
    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerHorizSwipeGesture = 1; # Three finger swipe left/right for spaces
      TrackpadTwoFingerDoubleTapGesture = true; # Two finger double tap for smart zoom
    };
  };
}
