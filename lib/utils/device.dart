import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chromix/generated/l10n.dart';

/// Get app locale
Locale appLocale() {
  if (kIsWeb) {
    return const Locale('en');
  } else {
    final systemLangCode = Platform.localeName.split('_').first;
    final locale = S.delegate.supportedLocales.firstWhere(
          (it) => it.languageCode == systemLangCode,
      orElse: () => const Locale('en'),
    );
    return locale;
  }
}
