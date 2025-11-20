import 'package:linter_rules/linter_rules.dart';
import 'package:test/test.dart';

void main() {
  group('latestVgaVersion', () {
    test('returns the latest very good analysis version', () {
      final version = latestVgaVersion();

      expect(version, equals('10.1.0'));
    });

    test('throws $ArgumentError if the file is not found', () {
      expect(
        () => latestVgaVersion(filePath: 'invalid'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test(
      'throws $ArgumentError if the version is not found in '
      'the given file path',
      () {
        expect(
          () => latestVgaVersion(
            filePath: 'test/test_data/corrupted_analysis_options.yaml',
          ),
          throwsA(isA<ArgumentError>()),
        );
      },
    );
  });
}
