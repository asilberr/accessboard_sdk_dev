import 'package:flutter/material.dart';
import 'package:accessboard_models/src/models/design/design.dart';
import 'package:accessboard_models/src/models/design/custom_design.dart'
    as custom;
import 'package:accessboard_models/src/models/design/design_enums.dart';

/// Manages the theme for the app, including design and customizations.
class ThemeManager {
  /// Creates a [ThemeManager] instance with the provided [design] and [customDesign].
  ThemeManager({
    required this.design,
    required this.customDesign,
  });

  /// The design of the app.
  final Design design;

  /// The custom design of the app.
  final custom.CustomDesign? customDesign;

  /// Retrieves the primary color of the app.
  Color get primaryColor =>
      customDesign?.primaryColor ?? design.primaryColor ?? Colors.black;

  /// Retrieves the secondary color of the app.
  Color get secondaryColor =>
      customDesign?.secondaryColor ??
      design.secondaryColor ??
      Colors.grey[500]!;

  /// Retrieves the tertiary color of the app.
  Color get tertiaryColor =>
      customDesign?.tertiaryColor ?? design.tertiaryColor ?? Colors.lightBlue;

  /// Retrieves the border radius used in the app.
  BorderRadius get borderRadius {
    final borderRadiusEnum =
        customDesign?.borderRadiusEnum ?? design.borderRadiusEnum;
    switch (borderRadiusEnum) {
      case BorderRadiusEnum.small:
        return BorderRadius.circular(4);
      case BorderRadiusEnum.medium:
        return BorderRadius.circular(8);
      case BorderRadiusEnum.large:
        return BorderRadius.circular(16);
      default:
        return BorderRadius.circular(8);
    }
  }

  /// Retrieves the border used in the app.
  Border get border {
    final borderEnum = customDesign?.borderEnum ?? design.borderEnum;
    switch (borderEnum) {
      case BorderEnum.none:
        return Border.all(width: 0, color: Colors.transparent);
      case BorderEnum.small:
        return Border.all(width: 1, color: Colors.grey.shade300);
      case BorderEnum.medium:
        return Border.all(width: 2, color: Colors.grey.shade300);
      case BorderEnum.large:
        return Border.all(width: 4, color: Colors.grey.shade300);
      default:
        return Border.all(width: 2, color: Colors.grey.shade300);
    }
  }

  /// Retrieves the shadow used in the app.
  BoxShadow get boxShadow {
    final shadowEnum = customDesign?.shadowEnum ?? design.shadowEnum;
    switch (shadowEnum) {
      case ShadowEnum.none:
        return const BoxShadow(
          color: Colors.transparent,
        );
      case ShadowEnum.small:
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 2),
        );
      case ShadowEnum.medium:
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 8,
          offset: const Offset(0, 4),
        );
      case ShadowEnum.large:
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 16,
          offset: const Offset(0, 8),
        );
      default:
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 8,
          offset: const Offset(0, 4),
        );
    }
  }
}
