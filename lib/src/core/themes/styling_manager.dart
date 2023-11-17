import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Manages the styling of the app, including colors, font size, and font family.
class StylingManager {
  // Default values for styling in case data is not available.
  static const Color _defaultPrimaryColor = Colors.black;
  static const Color _defaultSecondaryColor = Colors.white;
  static const double _defaultFontSize = 16.0;
  final String _defaultFontFamily = GoogleFonts.notoSansDisplay().fontFamily!;

  final CollectionReference stylingCollection;

  /// Constructor for the StylingManager class.
  ///
  /// [stylingCollection]: The Firestore collection storing styling information.
  StylingManager({
    required this.stylingCollection,
  }) {
    _initializeStylingStreams();
  }

  /// Stream providing the primary color of the app.
  late Stream<Color> primaryColorStream;

  /// Stream providing the secondary color of the app.
  late Stream<Color> secondaryColorStream;

  /// Stream providing the font size of the app.
  late Stream<double> fontSizeStream;

  /// Stream providing the font family of the app.
  late Stream<String> fontFamilyStream;

  /// Converts a color name to a Color object.
  Color? getColorFromString(String colorName) {
    final colorMap = {
      'red': Colors.red,
      'green': Colors.green,
      'blue': Colors.blue,
      'yellow': Colors.yellow,
      'lightGrey': Colors.grey[200],
    };

    return colorMap[colorName];
  }

  /// Converts a font size name to a double value.
  double? getFontSize(String fontSize) {
    final sizeMap = {
      'small': 14.0,
      'normal': 16.0,
      'big': 20.0,
    };

    return sizeMap[fontSize];
  }

  /// Converts a font family name to the corresponding Google Font family.
  String? getFontFamily(String fontFamilyName) {
    final fontFamilyMap = {
      'noto sans': GoogleFonts.notoSans().fontFamily,
      'noto sans display': GoogleFonts.notoSansDisplay().fontFamily,
      'roboto': GoogleFonts.roboto().fontFamily,
      'pacifico': GoogleFonts.pacifico().fontFamily,
      'abril fatface': GoogleFonts.abrilFatface().fontFamily,
      'lora': GoogleFonts.lora().fontFamily,
      'lato': GoogleFonts.lato().fontFamily,
      'montserrat': GoogleFonts.montserrat().fontFamily,
      'raleway': GoogleFonts.raleway().fontFamily,
      'dancing script': GoogleFonts.dancingScript().fontFamily,
      'indie flower': GoogleFonts.indieFlower().fontFamily,
      'lobster': GoogleFonts.lobster().fontFamily,
      'kaushan script': GoogleFonts.kaushanScript().fontFamily,
      'caveat': GoogleFonts.caveat().fontFamily,
      // Add more fonts here
    };
    return fontFamilyMap[fontFamilyName];
  }

  /// Initializes the styling streams using Firestore data.
  void _initializeStylingStreams() {
    primaryColorStream =
        stylingCollection.doc('stylingDocument').snapshots().map((event) {
      final data = event.data() as Map<String, dynamic>?;

      if (data != null) {
        return getColorFromString(data['primaryColor'] as String) ??
            _defaultPrimaryColor;
      } else {
        return _defaultPrimaryColor; // Default color if document doesn't exist
      }
    });

    secondaryColorStream =
        stylingCollection.doc('stylingDocument').snapshots().map((event) {
      final data = event.data() as Map<String, dynamic>?;

      if (data != null) {
        return getColorFromString(data['secondaryColor'] as String) ??
            _defaultSecondaryColor;
      } else {
        return _defaultSecondaryColor; // Default color if document doesn't exist
      }
    });

    fontSizeStream =
        stylingCollection.doc('stylingDocument').snapshots().map((event) {
      final data = event.data() as Map<String, dynamic>?;

      if (data != null) {
        return getFontSize(data['fontSize'] as String) ?? _defaultFontSize;
      } else {
        return _defaultFontSize; // Default fontSize if document doesn't exist
      }
    });

    fontFamilyStream =
        stylingCollection.doc('stylingDocument').snapshots().map((event) {
      final data = event.data() as Map<String, dynamic>?;

      if (data != null) {
        return getFontFamily(data['fontFamily'] as String) ??
            _defaultFontFamily;
      } else {
        return _defaultFontFamily; // Default font family if document doesn't exist
      }
    });
  }
}
