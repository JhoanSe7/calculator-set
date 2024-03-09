extension StringExtension on List<String> {
  String formatter({bool isInfinite = false}) {
    return "{${join(', ')}${isInfinite ? ", ..." : ""}}";
  }

  List<String> emptyFormat() {
    return map((e) => e.isEmpty ? "λ" : e).toList();
  }
}
