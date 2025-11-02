import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

/// Localization model
@JsonSerializable()
class LocalizationModel {
  /// Locale code
  String? locale;

  ///
  LocalizationModel({
    this.locale,
  });

  /// From JSON
  factory LocalizationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizationModelFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$LocalizationModelToJson(this);
}
