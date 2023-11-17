import 'package:flutter/material.dart';

/// Navigate to a new screen with a Hero animation.
///
/// [context]: The build context.
/// [widgetToNavigate]: The widget to navigate to with a Hero animation.
void heroAnimation({
  required BuildContext context,
  required Widget destinationWidget,
}) {
  // Implementation
  Navigator.push(
    context,
    PageRouteBuilder<FadeTransition>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return destinationWidget;
      },
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
