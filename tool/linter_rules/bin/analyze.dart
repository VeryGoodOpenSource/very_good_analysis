import 'dart:io';

import 'package:args/args.dart';
import 'package:linter_rules/linter_rules.dart';

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
/// Set `--set-exit-if-changed` to exit with code 2 if there are deprecated
/// rules in the given Very Good Analysis version.
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
  final argsParser = ArgParser()
    ..addOption(
      'version',
      help:
          'The version of the VGA to check for deprecated rules. '
          'If not provided, the latest version will be used.',
    )
    ..addFlag(
      'set-exit-if-changed',
      help:
          '''Set the exit code to 2 if there are changes to the deprecated rules.''',
    );

  final parsedArgs = argsParser.parse(args);

  final version = parsedArgs['version'] as String? ?? latestVgaVersion();
  final setExitIfChanged = parsedArgs['set-exit-if-changed'] as bool;

  final dartRules = await allLinterRules(state: LinterRuleState.deprecated);
  log('Fetched ${dartRules.length} deprecated Dart linter rules');

  final vgaRules = await allVeryGoodAnalysisRules(version: version);
  log('Fetched ${vgaRules.length} Very Good Analysis rules');
  log('');

  final deprecatedDartRules = dartRules.map((rule) => rule.name).toSet();
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

  if (deprecatedVgaRules.isNotEmpty && setExitIfChanged) {
    exit(2);
  }
}
