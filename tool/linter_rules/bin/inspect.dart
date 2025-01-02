import 'dart:convert';

import 'package:http/http.dart';
import 'package:linter_rules/linter_rules.dart';
import 'package:linter_rules/src/models/linter_rule.dart';

/// The [Uri] to fetch all linter rules from.
final _allLinterRulesUri = Uri.parse(
  'https://raw.githubusercontent.com/dart-lang/site-www/refs/heads/main/src/_data/linter_rules.json',
);

// TODO(alestiago): Document usage.
Future<void> main(
  List<String> args, {
  void Function(String) log = print,
}) async {
  final version = args[0];

  final response = await get(_allLinterRulesUri);
  final json = jsonDecode(response.body) as List<dynamic>;

  final dartRules = json
      .map(
        (rule) => LinterRule.fromJson(rule as Map<String, dynamic>),
      )
      .toList();
  log('Fetched ${dartRules.length} Dart linter rules');

  final vgaRules = await allVeryGoodAnalysisRules(version: version);
  log('Fetched ${vgaRules.length} Very Good Analysis rules');
  log('');

  final deprecatedDartRules = dartRules
      .where((rule) => rule.state == LinterRuleState.deprecated)
      .map((rule) => rule.name)
      .toSet();
  final deprecatedVgaRules =
      vgaRules.where(deprecatedDartRules.contains).toList();
  final deprecationMessage = StringBuffer(
    '''Found ${deprecatedVgaRules.length} deprecated Dart rules (out of ${deprecatedDartRules.length} deprecated Dart rules) in Very Good Analysis ($version)${deprecatedVgaRules.isEmpty ? '.' : ':'}''',
  );
  for (final rule in deprecatedVgaRules) {
    deprecationMessage.write('\n  - $rule');
  }
  log(deprecationMessage.toString());
}
