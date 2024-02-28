import 'package:calculator/helpers/formatters.dart';
import 'package:flutter/material.dart';

import 'custom_button_widget.dart';
import 'custom_texfield_widget.dart';
import 'paragraph_widget.dart';
import 'title_widget.dart';

class CustomFormPowWidget extends StatefulWidget {
  final String title;
  final String label;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final Function firstAction;
  final Function secondAction;
  final Function firstOnChange;
  final Function secondOnChange;

  const CustomFormPowWidget({
    super.key,
    required this.title,
    required this.label,
    required this.firstController,
    required this.secondController,
    required this.firstAction,
    required this.secondAction,
    required this.firstOnChange,
    required this.secondOnChange,
  });

  @override
  State<CustomFormPowWidget> createState() => CustomFormPowWidgetState();
}

class CustomFormPowWidgetState extends State<CustomFormPowWidget> {
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(widget.title, textColor: Colors.lightGreen),
        const SizedBox(height: 10),
        CustomTextFieldWidget(
          title: widget.label,
          controller: widget.firstController,
          onChange: (str) => widget.firstOnChange(str),
          helpText: 'Ingrese una ${widget.label}',
          formatter: onlyAlphaNumeric(),
        ),
        const SizedBox(height: 10),
        CustomTextFieldWidget(
          title: 'Potencia',
          controller: widget.secondController,
          onChange: (str) => widget.secondOnChange(str),
          helpText: 'Ingrese un numero',
          textInputType: TextInputType.number,
          width: 0.4,
          formatter: onlyNumeric(),
        ),
        if (_showError) const ParagraphWidget('No deje campos vacios', textColor: Colors.redAccent, fontSize: 16),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButtonWidget(
              'Procesar',
              backgroundColor: Colors.lightGreen,
              onTap: () => _firstAction(),
            ),
            CustomButtonWidget(
              'Limpiar',
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
