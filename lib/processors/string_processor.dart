import 'package:calculator/models/view_response.dart';

class StringProcessor {
  int length(String a, String b) {
    return a.length + b.length;
  }

  String concatenate(String a, String b) {
    return a + b;
  }

  ViewResponse action(String a, String b, int index) {
    switch (index) {
      case 1:
        return ViewResponse(
          message:
              'La Longitud de la cadena A es ${a.length}\nLa Longitud de la cadena B es ${b.length}',
          body: 'La Longitud total es: ${length(a, b)}',
        );
      case 2:
        return ViewResponse(
          message: 'La Concatenación de las cadenas A y B es:',
          body: concatenate(a, b),
        );
      default:
        return ViewResponse(message: 'En construccion ...');
    }
  }
}

final stringProcessor = StringProcessor();
