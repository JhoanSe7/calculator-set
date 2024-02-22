import 'package:flutter/material.dart';

class GenericDialog {
  GenericDialog(this.context, this.title, {required this.content});

  final BuildContext context;
  final Widget title;
  final Widget content;

  void show() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: title,
          content: content,
        ),
      );
}
