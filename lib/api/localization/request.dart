import 'package:chromix/api/localization/dto.dart';

/// Localization request
class LocalizationRequest {
  /// Constructor model
  LocalizationRequest();

  /// Get localization
  Future<LocalizationModel> get(String locale) async {
    return LocalizationModel(locale: 'en');
  }
}
