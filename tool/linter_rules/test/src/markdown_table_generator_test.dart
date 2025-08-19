import 'package:linter_rules/linter_rules.dart';
import 'package:test/test.dart';

void main() {
  group('MarkdownTableGenerator', () {
    test('generates a markdown table', () {
      final markdown = generateMarkdownTable([
        ['Header 1', 'Header 2'],
        ['Row 1, Cell 1', 'Row 1, Cell 2'],
        ['Row 2, Cell 1', 'Row 2, Cell 2'],
      ]);

      expect(
        markdown,
        equals('''
| Header 1 | Header 2 |
| --- | --- |
| Row 1, Cell 1 | Row 1, Cell 2 |
| Row 2, Cell 1 | Row 2, Cell 2 |
'''),
      );
    });
  });
}
