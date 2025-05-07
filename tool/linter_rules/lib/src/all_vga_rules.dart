import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

/// The directory path containing the Very Good Analysis options.
///
/// It assumes that the current directory is the root of the `linter_rules`
/// package (tool/linter_rules).
final String _allVeryGoodAnalysisOptionsDirectoryPath = path.joinAll([
  '..',
  '..',
  'lib',
]);

/// The name of the analysis options file.
///
/// The [version] is expected to be in the format of `x.y.z`. For example,
/// `5.1.0`.
String _analysisOptionsFileName({required String version}) =>
    'analysis_options.$version.yaml';

/// Reads all linter rules currently enabled by the latest Very Good Analysis.
///
/// The [version] is expected to be in the format of `x.y.z`. For example,
/// `5.1.0`. When specifying the version it will read the analysis options file
/// from that specific version.
///
/// Throws an [ArgumentError] if the [version] is not found.
Future<Iterable<String>> allVeryGoodAnalysisRules({
  required String version,
}) async {
  final analysisOptionsFile = File(
    path.join(
      _allVeryGoodAnalysisOptionsDirectoryPath,
      _analysisOptionsFileName(version: version),
    ),
  );

  if (!analysisOptionsFile.existsSync()) {
    throw ArgumentError(
      '''Could not find analysis options file for version $version at ${analysisOptionsFile.path}''',
    );
  }

  final yaml = loadYaml(await analysisOptionsFile.readAsString()) as YamlMap;
  final linter = yaml['linter'] as YamlMap;
  final rules = linter['rules'] as YamlList;
  return rules.map((rule) => rule.toString());
}
