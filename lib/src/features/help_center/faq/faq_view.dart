import 'package:flutter/material.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_state.dart';
import 'package:accessboard_models/src/models/design/design.dart';
import 'package:accessboard_sdk_24/src/features/help_center/widgets/voting_vertical.dart';
import 'package:accessboard_sdk_24/src/core/constants/constant_sizes.dart';
import 'package:accessboard_sdk_24/src/core/themes/theme_manager.dart';
import 'package:accessboard_models/src/models/design/custom_design.dart';

/// A widget that displays a FAQ view.
class FaqView extends StatefulWidget {
  /// Creates a widget that displays a FAQ view.
  const FaqView({
    required this.faqModel,
    required this.defaultDesign,
    this.customDesign,
    Key? key,
  }) : super(key: key);

  /// The FAQ model.
  final FAQ faqModel;

  /// The custom design.
  final CustomDesign? customDesign;

  /// The default design.
  final Design defaultDesign;

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager(
      design: widget.defaultDesign,
      customDesign: widget.customDesign,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.faqModel.basicStrings.title,
          style: TextStyle(
            color: themeManager.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(ConstantSizes.p16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: widget.faqModel.basicStrings.search,
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      widget.faqModel.filterFaqItems('');
                    } else {
                      widget.faqModel.filterFaqItems(value);
                    }
                  },
                ),
              ),
            ),
          ),
          FaqListView(widget: widget),
          Expanded(flex: 1, child: FaqContactBox(widget: widget)),
        ],
      ),
    );
  }
}

/// A widget that displays a FAQ list view.
class FaqListView extends StatelessWidget {
  /// Creates a widget that displays a FAQ list view.
  const FaqListView({
    required this.widget,
    Key? key,
  }) : super(key: key);

  /// The FaqView widget.
  final FaqView widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ListenableBuilder(
        listenable: widget.faqModel,
        builder: (BuildContext context, Widget? child) {
          return ListView.builder(
            itemCount: widget.faqModel.filteredFaqItems.length,
            itemBuilder: (BuildContext context, int index) {
              return FaqElement(
                question: widget.faqModel.filteredFaqItems[index].question,
                answer: widget.faqModel.filteredFaqItems[index].answer,
              );
            },
          );
        },
      ),
    );
  }
}

/// A widget that displays a single FAQ element.
class FaqElement extends StatefulWidget {
  /// Creates a widget that displays a single FAQ element.
  const FaqElement({
    required this.question,
    required this.answer,
    Key? key,
  }) : super(key: key);

  /// The question.
  final String question;

  /// The answer.
  final String answer;

  @override
  State<FaqElement> createState() => _FaqElementState();
}

class _FaqElementState extends State<FaqElement> {
  late final FaqState _faqState;

  @override
  void initState() {
    super.initState();
    _faqState = FaqState(initialValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _faqState.faqState,
      builder: (context, value, child) {
        return ExpansionTile(
          trailing: Icon(
            _faqState.faqState.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
          ),
          title: Text(
            widget.question,
            style: TextStyle(
              fontWeight: _faqState.faqState.value
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          onExpansionChanged: (expanded) {
            _faqState.faqState.value = expanded;
          },
          backgroundColor: Colors.white,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: ConstantSizes.p16,
                vertical: 10,
              ),
              child: Text(widget.answer),
            ),
            gapH12,
            const Padding(
              padding: EdgeInsets.all(ConstantSizes.p16),
              child: VotingVertical(
                headline: 'Was this helpful?',
                questions: ['Yes', 'No'],
                elementId: '1',
              ),
            ),
          ],
        );
      },
    );
  }
}

/// A widget that displays a FAQ contact box.
class FaqContactBox extends StatefulWidget {
  /// Creates a widget that displays a FAQ contact box.
  const FaqContactBox({
    required this.widget,
    Key? key,
  }) : super(key: key);

  /// The FaqView widget.
  final FaqView widget;

  @override
  State<FaqContactBox> createState() => _FaqContactBoxState();
}

class _FaqContactBoxState extends State<FaqContactBox> {
  late final FaqState _faqState;

  @override
  void initState() {
    super.initState();
    _faqState = FaqState(initialValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantSizes.p16),
      child: ValueListenableBuilder(
        valueListenable: _faqState.faqState,
        builder: (BuildContext context, bool value, Widget? child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: value ? 200 : 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: value ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: GestureDetector(
              onTap: () {
                _faqState.toggleFaqState();
              },
              child: !value
                  ? Center(
                      child: Text(
                        widget.widget.faqModel.assistanceStrings.defaultText,
                        style: TextStyle(
                          color: value ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.widget.faqModel.assistanceStrings.expandedText,
                        ),
                        Text(
                          widget.widget.faqModel.assistanceStrings.contact,
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
