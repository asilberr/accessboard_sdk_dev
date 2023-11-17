import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that centralizes text styles used in the app UI.
class TextStyles {
  // Common font family for all text styles.
  static final String _defaultFontFamily =
      GoogleFonts.notoSansDisplay().fontFamily!;

  /// Title text style with increased font size and bold weight.
  static final headline1 = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  /// Title text style with a slightly smaller font size and bold weight.
  static final headline2 = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  /// Title text style with color customization for better visibility.
  static final headline3 = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey[900],
  );

  /// Title text style with an increased font size and bold weight.
  static final headline4 = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  /// Subtitle text style with a smaller font size and regular weight.
  static final subtitle1 = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  /// Subtitle text style with a slightly larger font size and regular weight.
  static final subtitle2 = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /// Body text style with a moderate font size.
  static final bodyText = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 14,
  );
}
