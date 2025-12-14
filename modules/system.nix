{...}: {
  nixpkgs.config.allowUnfree = true;

  # enable Touch ID and Watch ID for sudo commands
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
    reattach = true;
  };

  system.keyboard.remapCapsLockToControl = true; # caps -> control

  system.defaults = {
    # Mac Settings
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.ApplePressAndHoldEnabled = false;

    # Finder Settings
    finder.ShowPathbar = true;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "Nlsv"; # List view
    finder.ShowStatusBar = true;
    finder.CreateDesktop = false; # Disable desktop items

    # Dock Settings
    dock.autohide = true; # auto hide dock
    dock.autohide-delay = 0.0; # no delay for showing dock
    dock.show-recents = false; # Don't show recent apps
    dock.minimize-to-application = true; # Minimize apps into their icon
    dock.showhidden = true; # Make hidden apps' icons translucent
    dock.persistent-apps = [
      # set dock apps
      {
        app = "/Applications/Firefox.app/";
      }
      {
        app = "/Applications/Ghostty.app/";
      }
      {
        app = "/Applications/Xcode.app/";
      }
      {
        app = "/Applications/Obsidian.app/";
      }
      {
        app = "/Applications/Slack.app/";
      }
      {
        app = "/System/Applications/Mail.app/";
      }
      {
        app = "/Applications/Cider.app/";
      }
    ];

    # Trackpad
    trackpad.Clicking = true;
  };
}
