/// Generates a markdown table from a list of rows.
///
/// Example:
///
/// ```dart
/// final markdown = generateMarkdownTable(
///   [
///    ['Header 1', 'Header 2'],
///    ['Row 1, Cell 1', 'Row 1, Cell 2'],
///    ['Row 2, Cell 1', 'Row 2, Cell 2'],
///   ],
/// );
/// ```
///
/// The above example will generate the following markdown:
///
/// ```md
/// | Header 1 | Header 2 |
/// | --- | --- |
/// | Row 1, Cell 1 | Row 1, Cell 2 |
/// | Row 2, Cell 1 | Row 2, Cell 2 |
/// ```
String generateMarkdownTable(List<List<String>> rows) {
  final buffer =
      StringBuffer()
        ..writeln('| ${rows.first.join(' | ')} |')
        ..writeln('| ${rows.first.map((_) => '---').join(' | ')} |');
  for (var i = 1; i < rows.length; i++) {
    buffer.writeln('| ${rows[i].join(' | ')} |');
  }
  return buffer.toString();
}
