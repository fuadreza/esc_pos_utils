
import 'package:esc_pos_utils/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Replace any non printable character', () {
    final String char = '@Hello world! – Yes this work!';

    final String charClean = char.replaceNonPrintable(replaceWith: '');

    final String expected = '@Hello world!   Yes this work!';
    expect(charClean, expected);
  });

  test('Replace any non printable character on symbols character', () {
    final String char = '`~!@#\$%^&*()_+-={}[]|\\;:\"\'<>,.?/';

    final String charClean = char.replaceNonPrintable();

    final String expected = '`~!@#\$%^&*()_+-={}[]|\\;:\"\'<>,.?/';
    expect(charClean, expected);
  });

  test('Replace any non printable character on non ascii character', () {
    final String char = '’´» •yes';

    final String charClean = char.replaceNonPrintable();

    final String expected = '     yes';
    expect(charClean, expected);
  });
}