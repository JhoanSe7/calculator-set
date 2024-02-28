import 'package:calculator/models/view_response.dart';

class LanguageProcessor {
  String concatenate(String a, String b) {
    return a + b;
  }

  String pow(String a, String b) {
    String result = '';
    int n = int.parse(b);
    if (n == 0) return "λ";
    for (int i = 0; i < n; i++) {
      result += a;
    }
    return result;
  }

  String reverse(String a) {
    List<String> tempList = a.split('');
    tempList = tempList.reversed.toList();
    return tempList.join();
  }

  ViewResponse action(String a, String b, int index) {
    switch (index) {
      case 1:
        return ViewResponse(
          message: 'La Concatenación de las palabras A y B es:',
          body: concatenate(a, b),
        );
      case 2:
        return ViewResponse(
          message: 'La Potenciación de la palabra A = $a \nElevado a la potencia $b es:',
          body: pow(a, b),
        );
      case 3:
        return ViewResponse(
          message: 'La Trasposición o Inversa de la cadena es:',
          body: reverse(a),
        );

      default:
        return ViewResponse(message: 'En construccion ...');
    }
  }
}

final languageProcessor = LanguageProcessor();
