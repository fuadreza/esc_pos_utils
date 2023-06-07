
extension StringExtension on String? {

  /// Replaces all non-printable characters in value with a space.
  /// tabs, newline etc are all considered non-printable.
  String replaceNonPrintable({String replaceWith = ' '}) {
    if (this != null) {
      var charCodes = <int>[];

      for (final codeUnit in this!.codeUnits) {
        if (isPrintable(codeUnit)) {
          charCodes.add(codeUnit);
        } else {
          if (replaceWith.isNotEmpty) {
            charCodes.add(replaceWith.codeUnits[0]);
          }
        }
      }

      return String.fromCharCodes(charCodes);
    } else {
      return replaceWith;
    }
  }

  bool isPrintable(int codeUnit) {
    var printable = true;

    if (codeUnit < 32) printable = false;
    if (codeUnit >= 127) printable = false;

    return printable;
  }
}