enum AppLanguage {
  english,
  german
}

extension AppLanguageExtension on AppLanguage {

  String get home {
    switch (this) {
      case AppLanguage.english:
        return 'Home';
      case AppLanguage.german:
        return 'Home';
      default:
        return null;
    }
  }

  String get settings {
    switch (this) {
      case AppLanguage.english:
        return 'Settings';
      case AppLanguage.german:
        return 'Einstellungen';
      default:
        return null;
    }
  }

}