import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:linter_rules/linter_rules.dart';
import 'package:meta/meta.dart' show visibleForTesting;

/// Fetches all linter rules currently available in the Dart Language.
///
/// It reads and parses from a JSON file at [allLinterRulesUri].
///
/// Those linter rules that have been removed are not included in the list.
/// In addition, those linter rules that are related to a Dart SDK that is
/// working in progress are also not included.
Future<Iterable<LinterRule>> allLinterRules({
  LinterRuleState? state,
  void Function(String) log = print,
  @visibleForTesting
  Future<Response> Function(Uri url, {Map<String, String>? headers}) get = get,
}) async {
  final file = File(
    '${Directory.current.path}/rules.json',
  );
  final content = await file.readAsString();

  final json = jsonDecode(content) as List<dynamic>;

  final dartRules = json
      .map((rule) => LinterRule.fromJson(rule as Map<String, dynamic>))
      .where((rule) => rule.state != LinterRuleState.removed)
      .where((rule) => !rule.sinceDartSdk.contains('wip'));

  log('Fetched ${dartRules.length} Dart linter rules');
  log('');

  return dartRules
      .where((rule) => state == null || rule.state == state)
      .toList();
}
