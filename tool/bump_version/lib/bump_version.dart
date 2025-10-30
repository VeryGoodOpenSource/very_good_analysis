/// Bumps the version of the analysis options file.
///
/// This script will:
/// - Copy the most recent yaml to a new one with the new desired version.
/// - Include that file on the main yaml file `lib/analysis_options.yaml.
///
/// ## Usage
///
/// Run this script (from project root):
///
/// ```sh
/// dart tool/bump_version/lib/bump_version.dart <new_version>
/// ```
///
/// Where `<new_version>` is the new version to bump to in the format `x.y.z`.
/// For example: `10.0.0`.
library;

import 'dart:io';

/// A regular expression to match the latest analysis options version.
///
/// Given the following:
///
/// ```sh
/// include: package:very_good_analysis/analysis_options.10.0.0.yaml
/// ```
///
/// It is expected that the first matched group will be `10.0.0`.
final _latestAnalysisVersionRegExp = RegExp(
  r'analysis_options\.(\d+\.\d+\.\d+)\.yaml',
);

void main(List<String> args) => bumpVersion(args[0]);

/// Bumps the version of the analysis options file and the pubspec.yaml file.
void bumpVersion(String newVersion, {String basePath = ''}) {
  final analysisOptionsFile = File('${basePath}lib/analysis_options.yaml');
  final content = analysisOptionsFile.readAsStringSync();
  final latestVersion = _latestAnalysisVersionRegExp
      .firstMatch(content)
      ?.group(1);

  final latestAnalysisOptionsFile = File(
    '${basePath}lib/analysis_options.$latestVersion.yaml',
  );

  final newAnalysisOptionsFile = File(
    '${basePath}lib/analysis_options.$newVersion.yaml',
  );
  latestAnalysisOptionsFile.copySync(newAnalysisOptionsFile.path);

  final newContent = content.replaceFirst(
    _latestAnalysisVersionRegExp,
    'analysis_options.$newVersion.yaml',
  );
  analysisOptionsFile.writeAsStringSync(newContent);
}
