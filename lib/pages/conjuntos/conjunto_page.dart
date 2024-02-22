import 'package:calculator/helpers/list_extension.dart';
import 'package:calculator/helpers/widgets/custom_form_widget.dart';
import 'package:calculator/helpers/widgets/paragraph_widget.dart';
import 'package:calculator/helpers/widgets/title_widget.dart';
import 'package:calculator/processors/processor.dart';
import 'package:flutter/material.dart';

class ConjuntoPage extends StatefulWidget {
  final String title;
  final int index;

  const ConjuntoPage({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<ConjuntoPage> createState() => ConjuntoPageState();
}

class ConjuntoPageState extends State<ConjuntoPage> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();

  List<String> listA = [];
  List<String> listB = [];

  String _result = "";
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Conjuntos'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomFormWidget(
              title: widget.title,
              firstLabel: 'Conjunto A',
              secondLabel: 'Conjunto B',
              helpText: 'Ingrese un cadena separado por coma ( , )',
              errorText: 'No deje campos vacios',
              firstButton: 'Procesar',
              secondButton: 'Limpiar',
              firstController: controllerA,
              secondController: controllerB,
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

  _onConstruction() {
    setState(() {
      _message = 'En construccion ...';
      _result = "";
    });
    return;
  }

  _onUnion() {
    setState(() {
      _message = 'La ${widget.title} del Conjunto A y el Conjunto B es: ';
      _result = processor.union(listA, listB).formatter();
    });
  }

  _clear() {
    setState(() {
      controllerA.text = "";
      controllerB.text = "";
      listA.clear();
      listB.clear();
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

  _actions() {
    listA = controllerA.text.trim().split(",");
    listB = controllerB.text.trim().split(",");

    switch (widget.index) {
      case 2:
        return _onUnion();
      default:
        return _onConstruction();
    }
  }
}
