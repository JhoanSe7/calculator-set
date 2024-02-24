import 'package:calculator/helpers/widgets/custom_form_widget.dart';
import 'package:calculator/helpers/widgets/paragraph_widget.dart';
import 'package:calculator/helpers/widgets/title_widget.dart';
import 'package:calculator/processors/set_processor.dart';
import 'package:calculator/processors/string_processor.dart';
import 'package:flutter/material.dart';

class GeneratorPage extends StatefulWidget {
  final String title;
  final int index;
  final ViewPage view;

  const GeneratorPage({
    super.key,
    required this.title,
    required this.index,
    required this.view,
  });

  @override
  State<GeneratorPage> createState() => GeneratorPageState();
}

class GeneratorPageState extends State<GeneratorPage> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();

  List<String> _listA = [];
  List<String> _listB = [];
  String _chainA = "";
  String _chainB = "";

  String _result = "";
  String _message = "";
  String _title = "";
  String _helpText = "";
  String _label = "";

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    switch (widget.view) {
      case ViewPage.set:
        _title = "Conjuntos";
        _label = "Conjunto";
        _helpText = 'Ingrese los valores separados por coma ( , )';

      case ViewPage.string:
        _title = "Cadenas";
        _label = "Cadena";
        _helpText = 'Ingrese una cadena';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: TitleWidget(
          _title,
          textColor: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomFormWidget(
              title: widget.title,
              firstLabel: '$_label A',
              secondLabel: '$_label B',
              helpText: _helpText,
              errorText: 'No deje campos vacios',
              firstButton: 'Procesar',
              secondButton: 'Limpiar',
              firstController: _controllerA,
              secondController: _controllerB,
              firstAction: () => _actions(),
              secondAction: () => _clear(),
              firstOnChange: (str) => _clean(),
              secondOnChange: (str) => _clean(),
            ),
            if (_message.isNotEmpty) ...[
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ParagraphWidget(_message, textColor: Colors.grey[900], textAlign: TextAlign.center),
              ),
              const SizedBox(height: 10),
              TitleWidget(
                _result,
                textColor: Colors.lightGreen,
              ),
            ]
          ],
        ),
      ),
    );
  }

  _clear() {
    setState(() {
      _controllerA.text = "";
      _controllerB.text = "";
      _listA.clear();
      _listB.clear();
      _chainA = "";
      _chainB = "";
      _message = "";
      _result = "";
    });
  }

  _clean() {
    setState(() {
      _message = "";
      _result = "";
    });
  }

  _setProcessor() {
    _listA = _controllerA.text.split(",").map((a) => a.trim()).toList();
    _listB = _controllerB.text.split(",").map((b) => b.trim()).toList();
    final res = setProcessor.action(_listA, _listB, widget.index);
    setState(() {
      _message = res.message ?? '';
      _result = res.body ?? '';
    });
  }

  _stringProcessor() {
    _chainA = _controllerA.text.trim();
    _chainB = _controllerB.text.trim();
    final res = stringProcessor.action(_chainA, _chainB, widget.index);
    setState(() {
      _message = res.message ?? '';
      _result = res.body ?? '';
    });
  }

  _actions() {
    switch (widget.view) {
      case ViewPage.set:
        return _setProcessor();
      case ViewPage.string:
        return _stringProcessor();
    }
  }
}

enum ViewPage {
  set,
  string,
}
