extension StringExtension on List<String> {
  String formatter() {
    return "[${join(', ')}]";
  }
}
