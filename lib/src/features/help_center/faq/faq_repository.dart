import 'package:accessboard_sdk_24/src/features/help_center/faq/faq.dart';

/// A repository that provides a FAQ stream.
class FaqRepository {
  /// The FAQ stream used to display the FAQ.
  Stream<FAQ?> _faqStream = Stream.value(null);

  /// Gets the FAQ stream.
  Stream<FAQ?> get faqStream => _faqStream;

  /// Sets the FAQ stream.
  set faqStream(Stream<FAQ?> stream) {
    _faqStream = stream;
  }
}
