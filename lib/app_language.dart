enum AppLanguage { english, german }

extension AppLanguageExtension on AppLanguage {
  String get titleAboutUs {
    switch (this) {
      case AppLanguage.english:
        return 'About Us';
      case AppLanguage.german:
        return 'Über uns';
      default:
        return null;
    }
  }

  String get titleCreateGame {
    switch (this) {
      case AppLanguage.english:
        return 'Create Game';
      case AppLanguage.german:
        return 'Spiel erstellen';
      default:
        return null;
    }
  }

  String get titleFriends {
    switch (this) {
      case AppLanguage.english:
        return 'Friends';
      case AppLanguage.german:
        return 'Freunde';
      default:
        return null;
    }
  }

  String get titleGameHistory {
    switch (this) {
      case AppLanguage.english:
        return 'Game History';
      case AppLanguage.german:
        return 'Spielverlauf';
      default:
        return null;
    }
  }

  String get titleHome {
    switch (this) {
      case AppLanguage.english:
        return 'Home';
      case AppLanguage.german:
        return 'Home';
      default:
        return null;
    }
  }

  String get titleInvites {
    switch (this) {
      case AppLanguage.english:
        return 'Invites';
      case AppLanguage.german:
        return 'Einladungen';
      default:
        return null;
    }
  }

  String get titleProfile {
    switch (this) {
      case AppLanguage.english:
        return 'Profile';
      case AppLanguage.german:
        return 'Profil';
      default:
        return null;
    }
  }

  String get titleSettings {
    switch (this) {
      case AppLanguage.english:
        return 'Settings';
      case AppLanguage.german:
        return 'Einstellungen';
      default:
        return null;
    }
  }

  String get titleSocialMedia {
    switch (this) {
      case AppLanguage.english:
        return 'Social Media';
      case AppLanguage.german:
        return 'Social Media';
      default:
        return null;
    }
  }

  String get titleStats {
    switch (this) {
      case AppLanguage.english:
        return 'Stats';
      case AppLanguage.german:
        return 'Statistiken';
      default:
        return null;
    }
  }
}
