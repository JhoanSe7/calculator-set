class Processor {
  List<String> pertain(List<String> a, List<String> b) {
    return [];
  }

  List<String> union(List<String> a, List<String> b) {
    Set<String> unionSet = {};
    for (String element in a) {
      unionSet.add(element);
    }
    for (String element in b) {
      unionSet.add(element);
    }
    return unionSet.toList();
  }

  List<String> interception(List<String> a, List<String> b) {
    Set<String> interceptionSet = {};
    Set<String> setA = a.toSet();

    for (String element in b) {
      if (setA.contains(element)) {
        interceptionSet.add(element);
      }
    }
    return interceptionSet.toList();
  }
}

final processor = Processor();
