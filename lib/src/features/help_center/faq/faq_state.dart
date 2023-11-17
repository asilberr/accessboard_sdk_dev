import 'package:flutter/material.dart';

/// Manages the state related to the FAQ.
class FaqState extends ChangeNotifier {
  /// The value notifier for the FAQ state.
  late final ValueNotifier<bool> _faqState;

  /// Gets the value notifier for the FAQ state.
  ValueNotifier<bool> get faqState => _faqState;

  /// Creates an instance of [FaqState] with an initial value.
  FaqState({required bool initialValue}) {
    _faqState = ValueNotifier<bool>(initialValue);
  }

  /// Toggles the FAQ state and notifies listeners.
  void toggleFaqState() {
    _faqState.value = !_faqState.value;
    notifyListeners();
  }
}
