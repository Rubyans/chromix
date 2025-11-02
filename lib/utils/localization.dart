import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chromix/api/localization/dto.dart';
import 'package:chromix/api/localization/request.dart';
import 'package:chromix/utils/device.dart';

/// Language service
class LanguageService extends ChangeNotifier {
  /// Language prefs
  final _LanguagePrefs _prefs = _LanguagePrefs();

  /// Current locale
  Locale? _locale;

  /// Localization instance
  Localization localization = Localization('en');

  /// Constructor model
  LanguageService() {
    localization.get().then((value) => notifyListeners());
    _prefs.getLanguage().then((language) {
      _applyLocaleAndNotify(language != null ? Locale(language) : null);
    });
  }

  /// Apply locale
  Future<void> _applyLocaleAndNotify(Locale? value) async {
    if (_locale != value) {
      _locale = value;
      notifyListeners();
    }
  }

  /// Custom locale
  Locale? get customLocale => _locale;

  /// Current locale
  Locale get locale => customLocale ?? appLocale();

  /// Strings model
  LocalizationModel get s => localization.s;

  /// Set language
  Future<void> setLanguage(String language) => _prefs
      .setLanguage(language)
      .then((_) => _applyLocaleAndNotify(Locale(language)));
}

/// Language prefs
class _LanguagePrefs {
  /// Key for storage
  static const keyLanguage = "keyLanguagePrefs";

  /// Shared prefs
  Future<SharedPreferences> _prefs() => SharedPreferences.getInstance();

  /// Save language
  Future<void> setLanguage(String language) =>
      _prefs().then((prefs) => prefs.setString(keyLanguage, language));

  /// Get language
  Future<String?> getLanguage() =>
      _prefs().then((prefs) => prefs.getString(keyLanguage));
}

/// Localization handler
class Localization {
  /// Constructor model
  Localization(this.stringLocale);

  /// Locale string
  String stringLocale;

  /// Localization data
  LocalizationModel s = LocalizationModel();

  /// Request API
  final LocalizationRequest request = LocalizationRequest();

  /// Get data
  Future<LocalizationModel> get() async {
    final LocalizationModel local = await request.get(stringLocale);
    return local;
  }
}
