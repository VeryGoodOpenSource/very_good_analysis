import 'package:linter_rules/linter_rules.dart';

/// Updates the Very Good Analysis documentation for all those rules that are
/// not enabled by Very Good Analysis in the given version.
///
/// Should be run from the root of the `linter_rules` package (tool/linter_rules).
///
/// Arguments:
/// - [version]: The version of the Very Good Analysis to update the
/// documentation for. Should be in the format of `x.y.z`. For example, `5.1.0`.
///
/// To use the tool run (from tool/linter_rules):
/// ```sh
/// dart lib/update_exclusion_reasons.dart 5.1.0
/// ```
Future<void> main(
  List<String> args, {
  void Function(String) log = print,
}) async {
  final version = args[0];

  final linterRules = (await allLinterRules()).toSet();
  log('Found ${linterRules.length} available linter rules');

  final veryGoodAnalysisRules =
      (await allVeryGoodAnalysisRules(version: version)).toSet();
  log('Found ${veryGoodAnalysisRules.length} Very Good Analysis rules');

  final disabledRules = linterRules.difference(veryGoodAnalysisRules);
  log('Found ${disabledRules.length} disabled rules');

  final exclusionReasons = {
    for (final rule in disabledRules) rule: 'Not specified',
    ...await readExclusionReasons(),
  };
  await writeExclusionReasons(exclusionReasons);

  final headers = ['Rule', 'Reason'];
  final rows = disabledRules.map((rule) {
    final reason = exclusionReasons[rule]!;
    return [rule, reason];
  }).toList();

  final markdownTable = generateMarkdownTable(
    [
      [...headers],
      ...rows,
    ],
  );

  print(markdownTable);
}
