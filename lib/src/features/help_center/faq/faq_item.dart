/// Represents a Frequently Asked Questions (FAQ) item.
class FaqItem {
  /// Unique identifier for the FAQ item.
  final String faqItemId;

  /// The question associated with the FAQ item.
  final String question;

  /// The answer to the FAQ item's question.
  final String answer;

  /// Creates a new [FaqItem] instance.
  FaqItem({
    required this.faqItemId,
    required this.question,
    required this.answer,
  });

  /// Creates a [FaqItem] instance from a JSON map.
  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      faqItemId: json['faqItemId'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }

  /// Converts the [FaqItem] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'faqItemId': faqItemId,
      'question': question,
      'answer': answer,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaqItem &&
        other.faqItemId == faqItemId &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => faqItemId.hashCode ^ question.hashCode ^ answer.hashCode;
}
