import 'package:linter_rules/linter_rules.dart';

/// The reason to fallback to if no reason is found in the exclusion reasons
/// file.
const _noReasonFallback = 'Not specified';

/// The tag delimiting the start and end of the excluded rules table in the
/// README.md file.
const ReadmeTag _excludedRulesTableTag = (
  '<!-- start:excluded_rules_table -->',
  '<!-- end:excluded_rules_table -->',
);

/// The link to the documentation for the given linter [rule].
String _linterRuleLink(String rule) {
  return 'https://dart.dev/tools/linter-rules/$rule';
}

/// Updates the README table with all those rules that are not enabled by
/// Very Good Analysis in the given version, together with the reason for
/// disabling them.
///
/// If no reason is found in the exclusion reasons file, it will default to
/// [_noReasonFallback]. Those rules that are not found in the exclusion reasons
/// will then be written to the exclusion reasons file with the default reason.
/// The exclusion reasons file will not be formatted after it is updated by the
/// tool, hence, for it to be a readable JSON, a JSON formatter should be run
/// after running this tool to format it.
///
/// Those rules that were previously excluded but are now enabled by Very Good
/// Analysis will not be included in the table, and their exclusion reason will
/// be removed from the exclusion reasons file.
///
/// Should be run from the root of the `linter_rules` package (tool/linter_rules),
/// with the version of the Very Good Analysis to update the documentation for
/// as the first argument.
///
/// The version argument should be in the format of `x.y.z`. For example,
/// `5.1.0`.
///
/// To use the tool run (from tool/linter_rules):
/// ```sh
/// dart lib/exclusion_reason_table.dart $version
/// ```
///
/// Where `$version` is the version of the Very Good Analysis to log the table
/// for.
///
/// The new table will be written to the README.md file. However, it might not
/// follow the same formatting as the rest of the file, so it is recommended to
/// manually format it after running the tool.
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

  final excludedRules = linterRules.difference(veryGoodAnalysisRules);
  log('Found ${excludedRules.length} excluded rules');

  final previousExclusionReasons = await readExclusionReasons();
  final exclusionReasons = {
    for (final rule in excludedRules)
      rule: previousExclusionReasons[rule] ?? _noReasonFallback,
  };
  await writeExclusionReasons(exclusionReasons);

  final markdownTable = generateMarkdownTable(
    [
      ['Rule', 'Reason'],
      ...excludedRules.map((rule) {
        final ruleMarkdownLink = '[`$rule`](${_linterRuleLink(rule)})';
        return [ruleMarkdownLink, exclusionReasons[rule]!];
      }),
    ],
  );

  final readme = Readme();
  await readme.updateTagContent(_excludedRulesTableTag, '\n$markdownTable');

  log('''Updated the README.md file with the excluded rules table.''');
}
