import 'dart:io';

import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'package:linter_rules/linter_rules.dart';

/// The reason to fallback to if no reason is found in the exclusion reasons
/// file.
const _noReasonFallback = 'Not specified';

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
/// The new table will be written to the README.md file. However, it might not
/// follow the same formatting as the rest of the file, so it is recommended to
/// manually format it after running the tool.
///
/// ## Usage
///
/// To use the tool run (from tool/linter_rules):
/// ```sh
/// dart lib/exclusion_reason_table.dart
/// ```
///
/// ## Options
///
/// * `--version`: The version of the Very Good Analysis to update the table
/// for, defaults to the latest version found in the lib analysis options file.
/// * `--set-exit-if-changed`: Set the exit code to 2 if there are changes to
/// the exclusion reasons.
Future<void> main(
  List<String> args, {
  void Function(String) log = print,
}) async {
  final argsParser = ArgParser()
    ..addOption(
      'version',
      help: 'The version of the Very Good Analysis to update the table for.',
    )
    ..addFlag(
      'set-exit-if-changed',
      help:
          '''Set the exit code to 2 if there are changes to the exclusion reasons.''',
    );
  final parsedArgs = argsParser.parse(args);

  final version = parsedArgs['version'] as String? ?? latestVgaVersion();
  final setExitIfChanged = parsedArgs['set-exit-if-changed'] as bool;

  final linterRules = (await allLinterRules()).map((rule) => rule.name).toSet();
  log('Found ${linterRules.length} available linter rules');

  final veryGoodAnalysisRules = (await allVeryGoodAnalysisRules(
    version: version,
  )).toSet();
  log('Found ${veryGoodAnalysisRules.length} Very Good Analysis rules');

  final excludedRules = linterRules.difference(veryGoodAnalysisRules).toList()
    ..sort();
  log('Found ${excludedRules.length} excluded rules');

  final previousExclusionReasons = await readExclusionReasons();
  final exclusionReasons = {
    for (final rule in excludedRules)
      rule: previousExclusionReasons[rule] ?? _noReasonFallback,
  };

  final hasChanged = !const DeepCollectionEquality().equals(
    previousExclusionReasons,
    exclusionReasons,
  );
  if (!hasChanged) {
    log('No changes to the exclusion reasons');
    return;
  }

  await writeExclusionReasons(exclusionReasons);
  final readme = Readme();
  final markdownTable = readme.generateExcludedRulesTable(
    excludedRules,
    exclusionReasons,
  );

  await readme.updateTagContent(excludedRulesTableTag, '\n$markdownTable');

  log('''Updated the README.md file with the excluded rules table.''');

  if (hasChanged && setExitIfChanged) {
    exit(2);
  }
}
