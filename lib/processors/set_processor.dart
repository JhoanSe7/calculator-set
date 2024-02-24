import 'package:calculator/helpers/list_extension.dart';
import 'package:calculator/models/view_response.dart';

class SetProcessor {
  bool pertain(List<String> a, List<String> b) {
    Set<String> setA = a.toSet();
    for (String element in b) {
      if (!setA.contains(element)) {
        return false;
      }
    }
    return true;
  }

  List<String> union(List<String> a, List<String> b) {
    Set<String> resultSet = {};
    for (String element in a) {
      resultSet.add(element);
    }
    for (String element in b) {
      resultSet.add(element);
    }
    return resultSet.toList();
  }

  List<String> interception(List<String> a, List<String> b) {
    Set<String> resultSet = {};
    Set<String> setA = a.toSet();

    for (String element in b) {
      if (setA.contains(element)) {
        resultSet.add(element);
      }
    }
    return resultSet.toList();
  }

  List<String> complement(List<String> a, List<String> b) {
    List<String> resultList = [];
    Set<String> setB = b.toSet();
    for (String element in a) {
      if (!setB.contains(element)) {
        resultList.add(element);
      }
    }
    return resultList;
  }

  List<String> absolute(List<String> a, List<String> b) {
    List<String> resultList = [];
    Set<String> setB = b.toSet();
    for (String element in a) {
      if (!setB.contains(element)) {
        resultList.add(element);
      }
    }
    return resultList;
  }

  List<String> symmetric(List<String> a, List<String> b) {
    Set<String> resultSet = {};
    List<String> listA = absolute(a, b);
    List<String> listB = absolute(b, a);
    resultSet.addAll(listA);
    resultSet.addAll(listB);
    return resultSet.toList();
  }

  ViewResponse action(List<String> a, List<String> b, int index) {
    switch (index) {
      case 1:
        return ViewResponse(
            message:
                'El Conjunto B ${!pertain(a, b) ? 'NO' : ''} está contenido en el conjunto A');
      case 2:
        return ViewResponse(
          message: 'La Unión del Conjunto A y el Conjunto B es:',
          body: union(a, b).formatter(),
        );
      case 3:
        return ViewResponse(
          message: 'La Intersección del Conjunto A y el Conjunto B es:',
          body: interception(a, b).formatter(),
        );
      case 4:
        return ViewResponse(
          message: 'El Complemento del Conjunto B respecto al Conjunto A es:',
          body: complement(a, b).formatter(),
        );
      case 5:
        return ViewResponse(
          message:
              'La Diferencia Absoluta del Conjunto A respecto al Conjunto B es:',
          body: absolute(a, b).formatter(),
        );
      case 6:
        return ViewResponse(
          message: 'La Diferencia Simetrica del Conjunto A y el Conjunto B es:',
          body: symmetric(a, b).formatter(),
        );
      default:
        return ViewResponse(message: 'En construccion ...');
    }
  }
}

final setProcessor = SetProcessor();
