import 'package:accessboard_sdk_24/src/core/constants/constant_sizes.dart';
import 'package:flutter/material.dart';

/// A VotingScreen widget.
class VotingVertical extends StatefulWidget {
  /// {@macro voting_screen_widget}
  const VotingVertical({
    required this.headline,
    required this.questions,
    required this.elementId,
    super.key,
  });

  /// The headline of the voting screen.
  final String headline;

  /// The questions of the voting screen.
  final List<String> questions;

  /// The element id of the voting screen.
  final String elementId;

  @override
  _VotingVerticalState createState() => _VotingVerticalState();
}

class _VotingVerticalState extends State<VotingVertical> {
  // TO-DO: Implement SnackBar-Event

  int? selectedAnswerIndex;
  bool isBlinkingBlue = false; // Track blinking animation

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headline,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH12,
        Row(
          children: widget.questions.asMap().entries.map((e) {
            final index = e.key;
            final questions = e.value;
            final isSelected = index == selectedAnswerIndex;
            final textColor = isSelected ? Colors.blue : Colors.grey[700];
            final textWeight = isSelected ? FontWeight.bold : FontWeight.normal;

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedAnswerIndex = null;
                    isBlinkingBlue = false;
                  } else {
                    selectedAnswerIndex = index;
                    isBlinkingBlue = true;
                  }
                });
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: 200,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey[500]!,
                        width: isSelected ? 1.2 : 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        questions,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: textWeight,
                        ),
                      ),
                    ),
                  ),
                  gapW12,
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
