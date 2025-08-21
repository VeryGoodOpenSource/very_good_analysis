import 'dart:io';

import 'package:bump_version/bump_version.dart';
import 'package:linter_rules/linter_rules.dart';
import 'package:yaml_edit/yaml_edit.dart';

/// Removes deprecated rules from the analysis options file based on the
/// official Dart linter rules.
///
/// It will create a new version of the analysis options file and update the
/// exclusion reasons file and the table of excluded rules in the README.md
/// file.
Future<void> main({
  void Function(String) log = print,
}) async {
  const basePath = '../../';
  final deprecatedRules = await allLinterRules(
    state: LinterRuleState.deprecated,
  );
  final deprecatedRulesCount = deprecatedRules.length;
  log('Fetched $deprecatedRulesCount Dart deprecated linter rules');
  log('');

  if (deprecatedRulesCount == 0) {
    log('No deprecated Dart linter rules found.');
    return;
  }

  final latestVersion = latestVgaVersion();
  log('Latest Very Good Analysis version: $latestVersion');
  log('');

  final latestVgaRules = await allVeryGoodAnalysisRules(
    version: latestVersion,
  );
  log('Fetched ${latestVgaRules.length} Very Good Analysis linter rules');
  log('');

  final deprecatedVgaRules = latestVgaRules
      .where(
        (rule) => deprecatedRules.any((dartRule) => dartRule.name == rule),
      )
      .toList();
  final deprecatedVgaRulesCount = deprecatedVgaRules.length;
  log(
    'Found $deprecatedVgaRulesCount deprecated Very Good Analysis rules:',
  );

  if (deprecatedVgaRulesCount == 0) {
    log('No deprecated Very Good Analysis rules found.');
    return;
  }

  for (final rule in deprecatedVgaRules) {
    log('  - $rule');
  }
  log('');

  //// Update the exclusion reasons file.
  final currentExclusionReasons = await readExclusionReasons();
  final newExclusionReasons = currentExclusionReasons
    ..addAll({
      for (final rule in deprecatedVgaRules) rule: 'Deprecated',
    });
  await writeExclusionReasons(newExclusionReasons);
  log('''Updated the exclusion reasons file.''');
  log('');

  //// Bump the version of the Very Good Analysis package.
  final parts = latestVersion.split('.');
  // Increment the minor version.
  final newVersion = '${parts[0]}.${int.parse(parts[1]) + 1}.0';
  bumpVersion(
    newVersion,
    basePath: basePath,
  );
  log('Bumped Very Good Analysis version to $newVersion');
  log('');

  //// Remove deprecated rules from the analysis options file.
  final analysisOptionsFile = File(
    '$basePath/lib/analysis_options.$newVersion.yaml',
  );
  _removeLinterRules(
    analysisOptionsFile.path,
    deprecatedVgaRules,
  );

  //// Update the table of excluded rules in the README.md file.
  final readme = Readme();
  final currentExclusionReasonsKeys = currentExclusionReasons.keys.toList();
  final markdownTable = readme.generateExcludedRulesTable(
    currentExclusionReasonsKeys,
    currentExclusionReasons,
  );
  await readme.updateTagContent(excludedRulesTableTag, '\n$markdownTable');

  log('''Updated the README.md file with the excluded rules table.''');
}

void _removeLinterRules(String filePath, List<String> ruleNames) {
  final yamlEditor = YamlEditor(File(filePath).readAsStringSync());

  // Get the current rules list
  final rules = yamlEditor.parseAt(['linter', 'rules']) as List;

  // Remove rules in reverse order to avoid index shifting
  for (final ruleName in ruleNames.reversed) {
    final index = rules.indexOf(ruleName);
    if (index != -1) {
      yamlEditor.remove(['linter', 'rules', index]);
    }
  }

  // Write back to file
  File(filePath).writeAsStringSync(yamlEditor.toString());
}
