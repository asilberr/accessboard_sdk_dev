import 'package:flutter/material.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_view.dart';
import 'package:accessboard_models/src/models/design/design.dart';

/// A widget that displays a FAQ stream.
class FaqStream extends StatefulWidget {
  /// Creates a widget that displays a FAQ stream.
  const FaqStream({
    required this.faqStream,
    Key? key,
  }) : super(key: key);

  /// The FAQ stream used to display the FAQ.
  final Stream<FAQ?> faqStream;

  @override
  State<FaqStream> createState() => _FaqStreamState();
}

class _FaqStreamState extends State<FaqStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FAQ?>(
      stream: widget.faqStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.expand(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final FAQ faq = snapshot.data!;

        return FaqView(
          faqModel: faq,
          defaultDesign: Design(designId: '1'),
        );
      },
    );
  }
}
