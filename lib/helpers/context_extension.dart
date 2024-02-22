import 'package:flutter/material.dart';

import 'widgets/title_widget.dart';

extension ContextExtension on BuildContext {
  void showLoading({String? text, Color? color}) => showDialog(
        context: this,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: color),
              const SizedBox(height: 20),
              TitleWidget(text ?? "Cargando"),
            ],
          ),
        ),
      );

  void hideLoading() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }
}
