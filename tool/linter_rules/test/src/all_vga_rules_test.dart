import 'package:linter_rules/linter_rules.dart';
import 'package:test/test.dart';

void main() {
  group('allVeryGoodAnalysisRules', () {
    test('returns all very good analysis rules', () async {
      final rules = await allVeryGoodAnalysisRules(
        filePath: 'test/test_data',
        version: '10.0.0',
      );

      expect(rules, [
        'always_declare_return_types',
        'always_put_required_named_parameters_first',
        'always_use_package_imports',
        'annotate_overrides',
        'avoid_bool_literals_in_conditional_expressions',
        'avoid_catches_without_on_clauses',
        'avoid_catching_errors',
        'avoid_double_and_int_checks',
        'avoid_dynamic_calls',
        'deprecated_member_use_from_same_package',
        'discarded_futures',
        'matching_super_parameters',
        'no_literal_bool_comparisons',
        'prefer_foreach',
        'require_trailing_commas',
        'switch_on_type',
        'unnecessary_ignore',
        'unnecessary_null_aware_operator_on_extension_on_nullable',
        'unnecessary_unawaited',
        'unreachable_from_main',
        'use_null_aware_elements',
        'use_truncating_division',
      ]);
    });

    test('throws $ArgumentError if the version is not found', () async {
      expect(
        () => allVeryGoodAnalysisRules(version: 'invalid'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
