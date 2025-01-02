import 'dart:convert';

import 'package:linter_rules/src/models/linter_rule.dart';
import 'package:test/test.dart';

import 'fixtures/all_linter_rules.dart';

void main() {
  group(LinterRuleState, () {
    group('fromJson', () {
      test('parses allLinterRules fixture', () {
        const fixture = allLinterRulesFixute;

        final json = jsonDecode(fixture) as List<dynamic>;
        expect(
          json,
          isNotEmpty,
          reason: 'The fixture should have at least one rule to parse.',
        );
        for (final rule in json) {
          expect(
            () => LinterRule.fromJson(rule as Map<String, dynamic>),
            returnsNormally,
          );
        }
      });
    });
  });
}
