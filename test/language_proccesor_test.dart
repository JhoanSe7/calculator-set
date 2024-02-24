import 'package:calculator/processors/language_proccesor.dart';
import 'package:test/test.dart';

void main() {
  group("Language test", () {
    test('Return concatenar languages', () {
      final languageProccesor = LanguageProccesor();
      List<String> languageFinal = languageProccesor
          .concatenacion(["nana", "napa", "lana"], ["napa", "papa", "pala"]);

      expect(languageFinal, [
        "nananapa",
        "nanapapa",
        "nanapala",
        "napanapa",
        "napapapa",
        "napapala",
        "lananapa",
        "lanapapa",
        "lanapala"
      ]);
    });

    test("Return potencia languages", () {
      final languageProccesor = LanguageProccesor();
      List<String> languageFinal = languageProccesor.potencia(["0", "1"], 3);

      expect(languageFinal, [
        "000",
        "001",
        "010",
        "011",
        "100",
        "101",
        "110",
        "111",
      ]);
    });

    test("Return reflexion inserva o trasposicion language", () {
      final languageProccesor = LanguageProccesor();
      List<String> languageFinal = languageProccesor
          .reflexionInversaTrasposicion(["nana", "napa", "lana"]);

      expect(languageFinal, ["anan", "apan", "anal"]);
    });
  });

  test("Return union languages", () {
    final languageProccesor = LanguageProccesor();
    List<String> languageFinal = languageProccesor
        .union(["nana", "napa", "lana"], ["napa", "papa", "pala"]);

    expect(languageFinal, ["nana", "napa", "lana", "napa", "papa", "pala"]);
  });

  test("Return interseccion languages", () {
    final languageProccesor = LanguageProccesor();
    List<String> languageFinal = languageProccesor
        .interseccion(["nana", "napa", "lana"], ["napa", "papa", "pala"]);

    expect(languageFinal, ["napa"]);
  });

  test("Return resta languages", () {
    final languageProccesor = LanguageProccesor();
    List<String> languageFinal = languageProccesor.resta(
        ["nana", "napa", "lana"],
        [" ", "nana", "napa", "pana", "palabra", "papa", "pala"]);

    List<String> languageFinal2 = languageProccesor.resta(
        [" ", "nana", "napa", "pana", "palabra", "papa", "pala"],
        ["nana", "napa", "lana"]);

    expect(languageFinal, ["lana"]);
    expect(languageFinal2, [" ", "pana", "palabra", "papa", "pala"]);
  });

  test("Return clausura Kleene languages", () {
    final languageProccesor = LanguageProccesor();
    List<String> languageFinal = languageProccesor.clausuraKleene(["0", "1"]);

    expect(languageFinal, [
      "",
      "0",
      "1",
      "00",
      "01",
      "10",
      "11",
      "000",
      "001",
      "010",
      "011",
      "100",
      "101",
      "110",
      "111"
    ]);
  });

  test("Return clausura positiva languages", () {
    final languageProccesor = LanguageProccesor();
    List<String> languageFinal = languageProccesor.clausuraPositiva(["0", "1"]);

    expect(languageFinal, [
      "0",
      "1",
      "00",
      "01",
      "10",
      "11",
      "000",
      "001",
      "010",
      "011",
      "100",
      "101",
      "110",
      "111"
    ]);
  });
}
