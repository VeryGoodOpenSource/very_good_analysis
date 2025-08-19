import 'dart:io';

import 'package:linter_rules/linter_rules.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

void main() {
  group('readme', () {
    test('updates the tag content', () async {
      final readmePath = path.joinAll(['..', '..', 'README.md']);
      final currentReadmeContent = await File(readmePath).readAsString();
      addTearDown(() async {
        await File(readmePath).writeAsString(currentReadmeContent);
      });

      final readme = Readme();

      const content = 'Test content';
      await readme.updateTagContent(excludedRulesTableTag, content);
      final readmeContent = await File(readmePath).readAsString();

      expect(
        readmeContent,
        contains(
          '''<!-- start:excluded_rules_table -->Test content<!-- end:excluded_rules_table -->''',
        ),
      );
    });

    test('throws StateError if the tag is not found', () async {
      final readme = Readme();
      await expectLater(
        () => readme.updateTagContent(('invalid', 'invalid'), 'Test content'),
        throwsA(isA<StateError>()),
      );
    });

    test('generates a markdown table of the excluded rules', () async {
      final excludedRules = ['always_put_control_body_on_new_line'];
      final exclusionReasons = {
        'always_put_control_body_on_new_line':
            '[Can conflict with the Dart formatter](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line)',
      };

      final markdownTable = Readme().generateExcludedRulesTable(
        excludedRules,
        exclusionReasons,
      );

      expect(
        markdownTable,
        equals('''
| Rule | Reason |
| --- | --- |
| [`always_put_control_body_on_new_line`](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line) | [Can conflict with the Dart formatter](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line) |
'''),
      );
    });
  });
}
