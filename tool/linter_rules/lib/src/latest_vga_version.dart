import 'dart:io';

import 'package:path/path.dart' as path;

/// The file path containing the latest Very Good Analysis options version.
///
/// It assumes that the current directory is the root of the `linter_rules`
/// package (tool/linter_rules).
final _latestVeryGoodAnalaysisFilePath = path.joinAll(
  ['..', '..', 'lib', 'analysis_options.yaml'],
);

/// Returns the latest Very Good Analysis version from the analysis options
/// file.
String latestVgaVersion() {
  final analysisOptionsFile = File(_latestVeryGoodAnalaysisFilePath);

  if (!analysisOptionsFile.existsSync()) {
    throw ArgumentError(
      '''Could not find analysis options file at ${analysisOptionsFile.path}''',
    );
  }

  final yaml = analysisOptionsFile.readAsStringSync();

  final versionRegex = RegExp(r'analysis_options\.(\d+\.\d+\.\d+)\.yaml');
  final match = versionRegex.firstMatch(yaml);

  if (match == null) {
    throw ArgumentError(
      '''Could not find Very Good Analysis version in ${analysisOptionsFile.path}''',
    );
  }

  return match.group(1)!;
}
