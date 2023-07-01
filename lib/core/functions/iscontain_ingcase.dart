bool containsIgnoreCase(String mainString, String subString) {
  List<String> subStrings = subString.split(' ');
  final lowercaseMainString = mainString.toLowerCase();
  for (var element in subStrings) {
    String lowercaseSubString = element.toLowerCase().replaceAll(' ', '');
    if (lowercaseMainString.contains(lowercaseSubString) && element != '') {
      return true;
    }
  }

  return false;
}
