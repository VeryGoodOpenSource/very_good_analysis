import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

/// The path to the document that lists the reasons for disabling a rule.
///
/// It assumes that the current directory is the root of the `linter_rules`
/// package (tool/linter_rules).
final String _reasonsFilePath = path.join('exclusion_reasons.json');

/// The reasons for disabling a rule.
///
/// The key is the rule name and the value is the reason for disabling the rule.
typedef LinterRulesReasons = Map<String, String>;

/// Reads all the reasons for disabling a rule.
Future<LinterRulesReasons> readExclusionReasons() async {
  final file = File(_reasonsFilePath);
  final json = await file.readAsString();
  final decodedJson = jsonDecode(json) as Map<String, dynamic>;
  return {
    for (final entry in decodedJson.entries) entry.key: entry.value as String,
  };
}

/// Writes all the reasons for disabling a rule.
Future<void> writeExclusionReasons(LinterRulesReasons reasons) async {
  // Sort the reasons by rule name to make the output more readable.
  final sortedReasons = Map<String, String>.fromEntries(
    reasons.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
  );
  final file = File(_reasonsFilePath);
  final json = const JsonEncoder.withIndent('  ').convert(sortedReasons);
  await file.writeAsString(json);
}
