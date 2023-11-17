import 'package:flutter/material.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_item.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_meta.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_stream.dart';

/// A widget that displays a FAQ page.
class FaqPage extends StatefulWidget {
  /// Creates a widget that displays a FAQ page.
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  // Replace this with your actual data source or fetch it from an API
  final Stream<FAQ> _faqStream = Stream.fromIterable([
    // Replace this with actual FAQ data
    FAQ(
      faqId: '1',
      faqItems: [
        FaqItem(
          faqItemId: '1',
          question: 'How do I get started with your app?',
          answer:
              'Simply download the app from your app store, sign up, and follow the on-screen instructions to start using it.',
        ),
        // ... Add more FAQ items
      ],
      metaData: FaqMeta(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      basicStrings: FaqBasicTexts(
        title: 'How can we help you?',
        search: 'Describe your issue...',
        noResults: 'No results found',
      ),
      assistanceStrings: FaqContactInformation(
        defaultText: 'Need more assistance?',
        expandedText:
            'You can contact our dedicated customer support team via email at',
        contact: 'Support@Accessboard.com',
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'faq_page',
      child: FaqStream(faqStream: _faqStream),
    );
  }
}
