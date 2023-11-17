/// Represents metadata associated with a Frequently Asked Questions (FAQ) item.
class FaqMeta {
  /// The timestamp when the FAQ item was created.
  final DateTime createdAt;

  /// The timestamp when the FAQ item was released (nullable).
  final DateTime? releasedAt;

  /// The timestamp when the FAQ item was last updated (nullable).
  final DateTime? updatedAt;

  /// Creates a new [FaqMeta] instance.
  FaqMeta({
    required this.createdAt,
    this.releasedAt,
    this.updatedAt,
  });

  /// Creates a [FaqMeta] instance from a JSON map.
  factory FaqMeta.fromJson(Map<String, dynamic> json) {
    return FaqMeta(
      createdAt: DateTime.parse(json['createdAt'] as String),
      releasedAt: json['releasedAt'] != null
          ? DateTime.parse(json['releasedAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  /// Converts the [FaqMeta] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'releasedAt': releasedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
