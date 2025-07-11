import 'dart:io';

import 'package:linter_rules/linter_rules.dart';
import 'package:path/path.dart' as path;

/// A tag indicates the start and end of a section in the README.
///
/// The first element is the start tag, and the second element is the end tag.
///
/// There is no forced format for these tags, but they are usually
/// HTML comments, to avoid rendering them in the README.
typedef ReadmeTag = (String, String);

/// A representation of the README file.
class Readme {
  /// The directory path containing the Very Good Analysis README.
  ///
  /// It assumes that the current directory is the root of the `linter_rules`
  /// package (tool/linter_rules).
  static final String _readmePath = path.joinAll(['..', '..', 'README.md']);

  late final _readmeFile = File(_readmePath);

  /// Updates the content between the [tag] in the README with the given
  /// [content].
  Future<void> updateTagContent(ReadmeTag tag, String content) async {
    final readmeContent = await _readmeFile.readAsString();
    final (startTag, endTag) = tag;

    final startTagIndex = readmeContent.indexOf(startTag);
    final endTagIndex = readmeContent.indexOf(endTag);

    if (startTagIndex == -1 || endTagIndex == -1) {
      throw StateError('Could not find the start or end tag in the README');
    }

    final newReadmeContent = readmeContent.replaceRange(
      startTagIndex + startTag.length,
      endTagIndex,
      content,
    );

    await _readmeFile.writeAsString(newReadmeContent);
  }

  /// Generates a markdown table of the excluded rules.
  String generateExcludedRulesTable(
    Iterable<String> excludedRules,
    Map<String, String> exclusionReasons,
  ) {
    // Sort the excluded rules to ensure a consistent order.
    final sortedExcludedRules = excludedRules.toList()..sort();
    final markdownTable = generateMarkdownTable([
      ['Rule', 'Reason'],
      ...sortedExcludedRules.map((rule) {
        final ruleMarkdownLink = '[`$rule`](${linterRuleLink(rule)})';
        return [ruleMarkdownLink, exclusionReasons[rule]!];
      }),
    ]);

    return markdownTable;
  }
}
