import 'dart:convert';

import 'package:http/http.dart';
import 'package:linter_rules/linter_rules.dart';

/// The [Uri] to fetch all linter rules from.
final Uri _allLinterRulesUri = Uri.parse(
  'https://raw.githubusercontent.com/dart-lang/site-www/refs/heads/main/src/_data/linter_rules.json',
);

/// Compares Very Good Analysis with the all available Dart linter rules.
///
/// Should be run from the root of the `linter_rules` package (tool/linter_rules).
///
///
/// To use the tool run (from tool/linter_rules):
/// ```sh
/// dart bin/analyze.dart
/// ```
///
/// A specific version can be analyzed by providing it as an argument,
/// otherwise the latest version will be used.
///
/// For example, to analyze version `5.1.0`:
///
/// ```sh
/// dart bin/analyze.dart 5.1.0
/// ```
///
/// It will log information about:
/// - The number of Dart linter rules fetched.
/// - The number of rules being declared in the given Very Good Analysis
/// with the given version.
/// - The number of deprecated rules Dart rules being used in Very Good
/// Analysis with the given version.
Future<void> main(
  List<String> args, {
  void Function(String) log = print,
}) async {
  final version = args.isNotEmpty ? args[0] : latestVgaVersion();

  final response = await get(_allLinterRulesUri);
  final json = jsonDecode(response.body) as List<dynamic>;

  final dartRules = json
      .map((rule) => LinterRule.fromJson(rule as Map<String, dynamic>))
      .toList();
  log('Fetched ${dartRules.length} Dart linter rules');

  final vgaRules = await allVeryGoodAnalysisRules(version: version);
  log('Fetched ${vgaRules.length} Very Good Analysis rules');
  log('');

  final deprecatedDartRules = dartRules
      .where((rule) => rule.state == LinterRuleState.deprecated)
      .map((rule) => rule.name)
      .toSet();
  final deprecatedVgaRules = vgaRules
      .where(deprecatedDartRules.contains)
      .toList();
  final deprecationMessage = StringBuffer(
    '''Found ${deprecatedVgaRules.length} deprecated Dart rules (out of ${deprecatedDartRules.length} deprecated Dart rules) in Very Good Analysis ($version)${deprecatedVgaRules.isEmpty ? '.' : ':'}''',
  );
  for (final rule in deprecatedVgaRules) {
    deprecationMessage.write('\n  - $rule');
  }
  log(deprecationMessage.toString());
}
