import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_item.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_meta.dart';
import 'package:flutter/material.dart';

/// FAQ model
class FAQ extends ChangeNotifier {
  /// Creates an instance of FAQ.
  FAQ({
    required this.faqId,
    required this.faqItems,
    required this.metaData,
    required this.basicStrings,
    required this.assistanceStrings,
  }) : _filteredFaqItems = List.from(faqItems);

  /// Creates an instance of FAQ from JSON.
  factory FAQ.fromJson(Map<String, dynamic> json) {
    final List<dynamic> faqItemsJson = json['faqItems'] as List<dynamic>;
    final List<FaqItem> faqItems = faqItemsJson
        .map((json) => FaqItem.fromJson(json as Map<String, dynamic>))
        .toList();

    return FAQ(
      faqId: json['faqId'] as String,
      faqItems: faqItems,
      metaData: FaqMeta.fromJson(json['metaData'] as Map<String, dynamic>),
      basicStrings:
          FaqBasicTexts.fromJson(json['basicStrings'] as Map<String, dynamic>),
      assistanceStrings: FaqContactInformation.fromJson(
          json['assistanceStrings'] as Map<String, dynamic>),
    );
  }

  /// FAQ ID
  final String faqId;

  /// FAQ items
  final List<FaqItem> faqItems;

  /// FAQ meta data
  final FaqMeta metaData;

  /// FAQ basic strings
  final FaqBasicTexts basicStrings;

  /// FAQ assistance strings
  final FaqContactInformation assistanceStrings;

  List<FaqItem> _filteredFaqItems;

  /// Filtered FAQ items
  List<FaqItem> get filteredFaqItems => _filteredFaqItems;

  /// Filter FAQ items
  void filterFaqItems(String query) {
    _filteredFaqItems = faqItems
        .where((faqItem) =>
            faqItem.question.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  /// Converts FAQ to JSON.
  Map<String, dynamic> toJson() {
    return {
      'faqId': faqId,
      'faqItems': faqItems.map((faqItem) => faqItem.toJson()).toList(),
      'metaData': metaData.toJson(),
      'basicStrings': basicStrings.toJson(),
      'assistanceStrings': assistanceStrings.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FAQ &&
        other.faqId == faqId &&
        other.faqItems == faqItems &&
        other.metaData == metaData;
  }

  @override
  int get hashCode => faqId.hashCode ^ faqItems.hashCode ^ metaData.hashCode;
}

/// FaqBasicTexts
class FaqBasicTexts {
  /// Creates an instance of FaqBasicTexts.
  FaqBasicTexts({
    this.title = 'How can we help you?',
    this.search = 'Describe your problem...',
    this.noResults = 'No results found',
  });

  /// Creates an instance of FaqBasicTexts from JSON.
  factory FaqBasicTexts.fromJson(Map<String, dynamic> json) {
    return FaqBasicTexts(
      title: json['title'] as String,
      search: json['search'] as String,
      noResults: json['noResults'] as String,
    );
  }

  /// Title
  final String title;

  /// Search
  final String search;

  /// No results
  final String noResults;

  /// Converts FaqBasicTexts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'search': search,
      'noResults': noResults,
    };
  }
}

/// FaqContactInformation
class FaqContactInformation {
  /// Creates an instance of FaqContactInformation.
  FaqContactInformation({
    this.defaultText = 'Need more assistance?',
    this.expandedText = 'Contact us',
    this.contact = 'Support@Accessboard.com',
  });

  /// Creates an instance of FaqContactInformation from JSON.
  factory FaqContactInformation.fromJson(Map<String, dynamic> json) {
    return FaqContactInformation(
      defaultText: json['defaultText'] as String,
      expandedText: json['expandedText'] as String,
      contact: json['contact'] as String,
    );
  }

  /// Default text
  final String defaultText;

  /// Expanded text
  final String expandedText;

  /// Contact
  final String contact;

  /// Converts FaqContactInformation to JSON.
  Map<String, dynamic> toJson() {
    return {
      'defaultText': defaultText,
      'expandedText': expandedText,
      'contact': contact,
    };
  }
}
