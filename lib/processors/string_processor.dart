import 'package:calculator/models/view_response.dart';

class StringProcessor {
  int length(String a, String b) {
    return a.length + b.length;
  }

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
          message: 'La Longitud de la cadena A es ${a.length}\nLa Longitud de la cadena B es ${b.length}',
          body: 'Long T = Long A + Long B\nLong T = ${length(a, b)}',
        );
      case 2:
        return ViewResponse(
          message: 'La Concatenación de las cadenas A y B es:',
          body: "A⋅B = ${concatenate(a, b)}",
        );
      case 3:
        return ViewResponse(
          message: 'La Potenciación de la cadena A = $a \nElevado a la potencia $b es:',
          body: "A^$b = ${pow(a, b)}",
        );
      case 4:
        return ViewResponse(
          message: 'La Trasposición o Inversa de la cadena es:',
          body: "A^R = ${reverse(a)}",
        );
      default:
        return ViewResponse(message: 'En construccion ...');
    }
  }
}

final stringProcessor = StringProcessor();
