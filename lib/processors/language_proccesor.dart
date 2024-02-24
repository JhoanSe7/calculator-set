import 'package:calculator/models/view_response.dart';

class LanguageProccesor {
  final int MAX_POWER_TO_CLAUSURA_KLEENE = 4;

  List<String> concatenacion(List<String> languageA, List<String> languageB) {
    List<String> finalLanguage = [];
    for (String wordA in languageA) {
      for (String wordB in languageB) {
        finalLanguage.add(wordA + wordB);
      }
    }

    return finalLanguage;
  }

  List<String> potencia(List<String> languageToPower, int power) {
    List<String> languagePower = languageToPower;
    for (int i = 1; i < power; i++) {
      languagePower = concatenacion(languagePower, languageToPower);
    }

    return languagePower;
  }

  List<String> reflexionInversaTrasposicion(List<String> language) {
    List<String> finalLanguage = [];
    for (String word in language) {
      finalLanguage.add(word.split('').reversed.join());
    }

    return finalLanguage;
  }

  List<String> union(List<String> languageA, List<String> languageB) {
    List<String> finalLanguage = [];
    finalLanguage.addAll(languageA);
    finalLanguage.addAll(languageB);
    return finalLanguage;
  }

  List<String> interseccion(List<String> languageA, List<String> languageB) {
    List<String> finalLanguage = [];
    for (String wordA in languageA) {
      if (languageB.contains(wordA)) {
        finalLanguage.add(wordA);
      }
    }
    return finalLanguage;
  }

  List<String> resta(List<String> languageA, List<String> languageB) {
    List<String> finalLanguage = [];
    for (String wordA in languageA) {
      if (!languageB.contains(wordA)) {
        finalLanguage.add(wordA);
      }
    }
    return finalLanguage;
  }

  List<String> clausuraKleene(List<String> languageToClausura) {
    List<String> finalLanguage = [];
    finalLanguage.add("");
    for (int i = 1; i < MAX_POWER_TO_CLAUSURA_KLEENE; i++) {
      finalLanguage.addAll(potencia(languageToClausura, i));
    }
    return finalLanguage;
  }

  List<String> clausuraPositiva(List<String> languageToClausura) {
    List<String> finalLanguage = [];
    for (int i = 1; i < MAX_POWER_TO_CLAUSURA_KLEENE; i++) {
      finalLanguage.addAll(potencia(languageToClausura, i));
    }
    return finalLanguage;
  }
}
