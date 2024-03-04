import 'package:calculator/helpers/list_extension.dart';
import 'package:calculator/models/view_response.dart';

class LanguageProcessor {
  final emptyChar = "λ";

  List<String> concatenate(List<String> a, List<String> b) {
    List<String> resultList = [];
    for (String x in a) {
      for (String y in b) {
        resultList.add(x + y);
      }
    }
    resultList.sort((a, b) => a.length.compareTo(b.length));
    return resultList;
  }

  List<String> pow(List<String> a, String b) {
    List<String> resultList = [];
    int n = int.parse(b);
    if (n == 0) {
      resultList.add(emptyChar);
      return resultList;
    }
    resultList.add('');
    for (int i = 0; i < n; i++) {
      resultList = concatenate(resultList, a);
    }
    resultList.sort((a, b) => a.length.compareTo(b.length));
    return resultList;
  }

  List<String> reverse(List<String> a) {
    List<String> resultList = [];
    for (String element in a) {
      var tempList = element.split('');
      resultList.add(tempList.reversed.toList().join());
    }
    return resultList;
  }

  ViewResponse action(List<String> a, List<String> b, int index) {
    switch (index) {
      case 1:
        return ViewResponse(
          message: 'La Concatenación de las palabras A y B es:',
          body: concatenate(a, b).formatter(),
        );
      case 2:
        return ViewResponse(
          message: 'La Potenciación de las palabras A = $a \nElevado a la potencia $b es:',
          body: pow(a, b.first).formatter(),
        );
      case 3:
        return ViewResponse(
          message: 'La Trasposición o Inversa de la cadena es:',
          body: reverse(a).formatter(),
        );

      default:
        return ViewResponse(message: 'En construccion ...');
    }
  }
}

final languageProcessor = LanguageProcessor();
