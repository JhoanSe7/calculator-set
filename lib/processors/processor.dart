class Processor {
  bool pertain(List<String> a, List<String> b) {
    Set<String> setA = a.toSet();
    for (String element in b) {
      if (!setA.contains(element)) {
        return true;
      }
    }
    return false;
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
}

final processor = Processor();
