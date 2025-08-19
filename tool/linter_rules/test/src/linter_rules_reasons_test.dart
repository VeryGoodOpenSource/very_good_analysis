import 'package:linter_rules/linter_rules.dart';
import 'package:test/test.dart';

void main() {
  group('linterRulesReasons', () {
    test('returns the linter rules reasons', () async {
      final reasons = await readExclusionReasons();

      expect(reasons, isNotEmpty);
      expect(reasons, isA<Map<String, String>>());
    });

    test('writes the linter rules reasons', () async {
      final currentReasons = await readExclusionReasons();
      addTearDown(() async {
        await writeExclusionReasons(currentReasons);
      });

      final reasons = {
        'always_put_control_body_on_new_line':
            '[Can conflict with the Dart formatter](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line)',
      };

      await writeExclusionReasons(reasons);

      final writtenReasons = await readExclusionReasons();
      expect(writtenReasons, equals(reasons));
    });
  });
}
