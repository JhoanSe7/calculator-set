import 'package:calculator/helpers/description.dart';
import 'package:calculator/helpers/widgets/custom_form_pow_widget.dart';
import 'package:calculator/helpers/widgets/custom_form_widget.dart';
import 'package:calculator/helpers/widgets/paragraph_widget.dart';
import 'package:calculator/helpers/widgets/title_widget.dart';
import 'package:calculator/processors/language_processor.dart';
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
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();

  List<String> _listA = [];
  List<String> _listB = [];
  String _chainA = "";
  String _chainB = "";

  String _result = "";
  String _message = "";
  String _title = "";
  String _helpText = "";
  String _label = "";
  bool _showPow = false;
  bool _hideBox = false;
  bool _separator = false;

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
        break;
      case ViewPage.string:
        _title = "Cadenas";
        _label = "Cadena";
        _helpText = 'Ingrese una cadena';
        _showPow = widget.index == 3;
        _hideBox = widget.index == 4;
        break;
      case ViewPage.language:
        _title = "Lenguajes";
        _label = "Palabra";
        _helpText = 'Ingrese las palabras separadas por coma ( , )';
        _showPow = widget.index == 2;
        _hideBox = widget.index == 3 || widget.index == 7 || widget.index == 8;
        _separator = widget.index == 2;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _showPow
                ? CustomFormPowWidget(
                    title: widget.title,
                    label: _label,
                    firstController: _controllerA,
                    secondController: _controllerB,
                    helpText: _helpText,
                    firstAction: () => _actions(),
                    secondAction: () => _clear(),
                    firstOnChange: (str) => _clean(),
                    secondOnChange: (str) => _clean(),
                    separator: _separator,
                  )
                : CustomFormWidget(
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
                    hideBox: _hideBox,
                  ),
            if (_message.isNotEmpty) ...[
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ParagraphWidget(_message, textColor: Colors.grey[900], textAlign: TextAlign.center),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: size.height * 0.2,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TitleWidget(
                          _result,
                          textColor: Colors.lightGreen,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
            if (_message.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ParagraphWidget(getLBL(widget.view, widget.index),
                    textColor: Colors.grey[900], textAlign: TextAlign.center),
              ),
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

  _languageProcessor() {
    _listA = _controllerA.text.split(",").map((a) => a.trim()).toList();
    _listB = _controllerB.text.split(",").map((b) => b.trim()).toList();
    final res = languageProcessor.action(_listA, _listB, widget.index);
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
      case ViewPage.language:
        return _languageProcessor();
    }
  }
}

enum ViewPage {
  set,
  string,
  language,
}
