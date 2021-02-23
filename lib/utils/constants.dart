import 'package:flutter/material.dart';

// Fonts
class AvailableFonts {
  static const primaryFont = "SFProText";
}


// sharedPreferences keys
class SavedPreferencesKeys {
  static const seenWalkThroughKey = "walkthrough";
}

// Icons
class AvailableIcons {
  static const homeActive = {
    'assetImage': AssetImage('assets/images/homeActive.png'),
    'assetPath': 'assets/images/homeActive.png',
  };

  static const homeInActive = {
    'assetImage': AssetImage('assets/images/homeInActive.png'),
    'assetPath': 'assets/images/homeInActive.png',
  };
}

// Images
class AvailableImages {
  static const appLogo = {
    'assetImage': AssetImage('assets/images/appLogo.png'),
    'assetPath': 'assets/images/appLogo.png',
  };

  static const welcomeLogo = {
    'assetImage': AssetImage('assets/images/welcomeLogo.png'),
    'assetPath': 'assets/images/welcomeLogo.png',
  };

  static const placeholder = {
    'assetImage': AssetImage('assets/images/placeholder.png'),
    'assetPath': 'assets/images/placeholder.png',
  };
}
