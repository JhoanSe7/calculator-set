import 'package:flutter/material.dart';

import 'custom_button_widget.dart';
import 'custom_texfield_widget.dart';
import 'paragraph_widget.dart';
import 'title_widget.dart';

class CustomFormWidget extends StatefulWidget {
  final String title;
  final String firstLabel;
  final String secondLabel;
  final String helpText;
  final String errorText;
  final String firstButton;
  final String secondButton;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final Function firstAction;
  final Function secondAction;
  final Function firstOnChange;
  final Function secondOnChange;

  const CustomFormWidget({
    super.key,
    required this.title,
    required this.firstLabel,
    required this.secondLabel,
    required this.helpText,
    required this.errorText,
    required this.firstButton,
    required this.secondButton,
    required this.firstController,
    required this.secondController,
    required this.firstAction,
    required this.secondAction,
    required this.firstOnChange,
    required this.secondOnChange,
  });

  @override
  State<CustomFormWidget> createState() => CustomFormWidgetState();
}

class CustomFormWidgetState extends State<CustomFormWidget> {
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(widget.title, textColor: Colors.lightGreen),
        const SizedBox(height: 10),
        CustomTextFieldWidget(
          title: widget.firstLabel,
          controller: widget.firstController,
          onChange: (str) => widget.firstOnChange(str),
          helpText: widget.helpText,
        ),
        const SizedBox(height: 10),
        CustomTextFieldWidget(
          title: widget.secondLabel,
          controller: widget.secondController,
          onChange: (str) => widget.secondOnChange(str),
          helpText: widget.helpText,
        ),
        if (_showError) ParagraphWidget(widget.errorText, textColor: Colors.redAccent, fontSize: 16),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButtonWidget(
              widget.firstButton,
              backgroundColor: Colors.lightGreen,
              onTap: () => _firstAction(),
            ),
            CustomButtonWidget(
              widget.secondButton,
              textColor: Colors.lightGreen,
              backgroundColor: Colors.white,
              onTap: () => _secondAction(),
            ),
          ],
        ),
      ],
    );
  }

  _firstAction() {
    FocusScope.of(context).unfocus();
    if (widget.firstController.text.trim().isEmpty || widget.secondController.text.trim().isEmpty) {
      setState(() {
        _showError = true;
      });
      return;
    }
    setState(() {
      _showError = false;
    });
    widget.firstAction();
  }

  _secondAction() {
    FocusScope.of(context).unfocus();
    setState(() {
      _showError = false;
    });
    widget.secondAction();
  }
}
