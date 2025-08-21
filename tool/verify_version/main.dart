import 'dart:io';

/// Verifies that the version in pubspec.yaml matches the version in
/// lib/analysis_options.yaml and lib/analysis_options.${version}.yaml.
void main() {
  final pubspecFile = File('pubspec.yaml');
  final analysisOptionsFile = File('lib/analysis_options.yaml');

  if (!pubspecFile.existsSync()) {
    stderr.writeln('❌ pubspec.yaml not found.');
    exit(1);
  }
  if (!analysisOptionsFile.existsSync()) {
    stderr.writeln('❌ lib/analysis_options.yaml not found.');
    exit(1);
  }

  // Extract version from pubspec.yaml
  final pubspecContent = pubspecFile.readAsStringSync();
  final pubspecVersionMatch =
      RegExp(r'version:\s*([\d]+\.[\d]+\.[\d]+)').firstMatch(pubspecContent);

  if (pubspecVersionMatch == null) {
    stderr.writeln('❌ Could not find a valid version in pubspec.yaml.');
    exit(1);
  }
  final pubspecVersion = pubspecVersionMatch.group(1)!;

  final versionedAnalysisFile =
      File('lib/analysis_options.$pubspecVersion.yaml');
  if (!versionedAnalysisFile.existsSync()) {
    stderr.writeln('❌ lib/analysis_options.$pubspecVersion.yaml not found.');
    exit(1);
  }

  // Extract version from lib/analysis_options.yaml
  final analysisContent = analysisOptionsFile.readAsStringSync();
  final includeMatch = RegExp(
    r'include:\s*package:very_good_analysis/analysis_options\.(\d+\.\d+\.\d+)\.yaml',
  ).firstMatch(analysisContent);

  if (includeMatch == null) {
    stderr.writeln('❌ Could not find version in lib/analysis_options.yaml.');
    exit(1);
  }
  final analysisVersion = includeMatch.group(1)!;

  // Compare versions
  if (pubspecVersion != analysisVersion) {
    stderr.writeln('❌ Version mismatch:\n'
        '- pubspec.yaml version: $pubspecVersion\n'
        '- lib/analysis_options.yaml version: $analysisVersion\n\n'
        'Please update lib/analysis_options.yaml to match pubspec.yaml.');
    exit(1);
  }

  print('✅ Versions match: $pubspecVersion');
}
