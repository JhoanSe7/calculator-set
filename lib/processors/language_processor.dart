import 'package:calculator/helpers/list_extension.dart';
import 'package:calculator/models/view_response.dart';

class LanguageProcessor {
  final emptyChar = "λ";
  final maxIteration = 4;

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

  List<String> union(List<String> a, List<String> b) {
    Set<String> resultSet = {};
    List<String> resultList = [];
    for (String element in a) {
      resultSet.add(element);
    }
    for (String element in b) {
      resultSet.add(element);
    }
    resultList = resultSet.toList();
    resultList.sort((a, b) => a.length.compareTo(b.length));

    return resultList.emptyFormat();
  }

  List<String> interception(List<String> a, List<String> b) {
    Set<String> resultSet = {};
    List<String> resultList = [];
    Set<String> setA = a.toSet();
    for (String element in b) {
      if (setA.contains(element)) {
        resultSet.add(element);
      }
    }
    resultList = resultSet.toList();
    resultList.sort((a, b) => a.length.compareTo(b.length));
    return resultList.emptyFormat();
  }

  List<String> subtraction(List<String> a, List<String> b) {
    List<String> resultList = [];
    for (String element in a) {
      if (!b.contains(element)) {
        resultList.add(element);
      }
    }
    resultList.sort((a, b) => a.length.compareTo(b.length));
    return resultList.emptyFormat();
  }

  List<String> kleeneClosure(List<String> a) {
    List<String> resultList = [];
    resultList.add("");
    for (int i = 1; i < maxIteration; i++) {
      resultList.addAll(pow(a, i.toString()));
    }
    resultList.sort((a, b) => a.length.compareTo(b.length));
    return resultList.emptyFormat();
  }

  List<String> positiveClosure(List<String> a) {
    List<String> resultList = [];
    for (int i = 1; i < maxIteration; i++) {
      resultList.addAll(pow(a, i.toString()));
    }
    resultList.sort((a, b) => a.length.compareTo(b.length));
    return resultList.emptyFormat();
  }

  ViewResponse action(List<String> a, List<String> b, int index) {
    switch (index) {
      case 1:
        return ViewResponse(
          message: 'La Concatenación de las palabras A y B es:',
          body: "A⋅B = ${concatenate(a, b).formatter()}",
        );
      case 2:
        return ViewResponse(
          message: 'La Potenciación de las palabras\nA = $a \nElevado a la potencia ${b.first} es:',
          body: "A^${b.first} = ${pow(a, b.first).formatter()}",
        );
      case 3:
        return ViewResponse(
          message: 'La Trasposición o Inversa de la cadena es:',
          body: "A^R = ${reverse(a).formatter()}",
        );
      case 4:
        return ViewResponse(
          message: 'La Unión de las Palabras A y las Palabras B es:',
          body: "A U B = ${union(a, b).formatter()}",
        );
      case 5:
        return ViewResponse(
          message: 'La Intersección de la Palabra A y la Palabra B es:',
          body: "A ∩ B = ${interception(a, b).formatter()}",
        );
      case 6:
        return ViewResponse(
          message: 'La Resta de las Palabra A y B se muestra de la siguiente manera:',
          body: "A-B = ${subtraction(a, b).formatter()}"
              "\n B-A = ${subtraction(b, a).formatter()}",
        );
      case 7:
        return ViewResponse(
          message: 'La Clausura de Kleene de la Palabra A es:',
          body: "L* = ${kleeneClosure(a).formatter(isInfinite: true)}",
        );
      case 8:
        return ViewResponse(
          message: 'La Clausura de Positiva de la Palabra A es:',
          body: "L+ = ${positiveClosure(a).formatter(isInfinite: true)}",
        );
      default:
        return ViewResponse(message: 'En construccion ...');
    }
  }
}

final languageProcessor = LanguageProcessor();
