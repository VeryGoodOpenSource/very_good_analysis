import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

/// The path to the document that lists the reasons for disabling a rule.
///
/// It assumes that the current directory is the root of the `linter_rules`
/// package (tool/linter_rules).
final _reasonsFilePath = path.join('exclusion_reasons.json');

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
  final file = File(_reasonsFilePath);
  final json = jsonEncode(reasons);
  await file.writeAsString(json);
}
