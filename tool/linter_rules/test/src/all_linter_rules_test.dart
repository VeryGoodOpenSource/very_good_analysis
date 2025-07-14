import 'package:http/http.dart';
import 'package:linter_rules/linter_rules.dart';
import 'package:test/test.dart';

// Create a minimal fixture
const minimalFixture = r"""
[
  {
    "name": "always_declare_return_types",
    "description": "Declare method return types.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** declare method return types.\n\nWhen declaring a method or function *always* specify a return type.\nDeclaring return types for functions helps improve your codebase by allowing the\nanalyzer to more adequately check your code for errors that could occur during\nruntime.\n\n**BAD:**\n```dart\nmain() { }\n\n_bar() => _Foo();\n\nclass _Foo {\n  _foo() => 42;\n}\n```\n\n**GOOD:**\n```dart\nvoid main() { }\n\n_Foo _bar() => _Foo();\n\nclass _Foo {\n  int _foo() => 42;\n}\n\ntypedef predicate = bool Function(Object o);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_put_control_body_on_new_line",
    "description": "Separate the control structure expression from its statement.",
    "categories": [
      "errorProne",
      "style"
    ],
    "state": "deprecated",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "From the [style guide for the flutter repo](https://flutter.dev/style-guide/):\n\n**DO** separate the control structure expression from its statement.\n\nDon't put the statement part of an `if`, `for`, `while`, `do` on the same line\nas the expression, even if it is short.  Doing so makes it unclear that there\nis relevant code there.  This is especially important for early returns.\n\n**BAD:**\n```dart\nif (notReady) return;\n\nif (notReady)\n  return;\nelse print('ok')\n\nwhile (condition) i += 1;\n```\n\n**GOOD:**\n```dart\nif (notReady)\n  return;\n\nif (notReady)\n  return;\nelse\n  print('ok')\n\nwhile (condition)\n  i += 1;\n```\n\nNote that this rule can conflict with the\n[Dart formatter](https://dart.dev/tools/dart-format), and should not be enabled\nwhen the Dart formatter is used.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_put_required_named_parameters_first",
    "description": "Put required named parameters first.",
    "categories": [
      "style"
    ],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** specify `required` on named parameter before other named parameters.\n\n**BAD:**\n```dart\nm({b, c, required a}) ;\n```\n\n**GOOD:**\n```dart\nm({required a, b, c}) ;\n```\n\n**BAD:**\n```dart\nm({b, c, @required a}) ;\n```\n\n**GOOD:**\n```dart\nm({@required a, b, c}) ;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_require_non_null_named_parameters",
    "description": "Specify `@required` on named parameters without defaults.",
    "categories": [],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.3.0; it is no longer functional.\n\n**DO** specify `@required` on named parameters without a default value on which\nan `assert(param != null)` is done.\n\n**BAD:**\n```dart\nm1({a}) {\n  assert(a != null);\n}\n```\n\n**GOOD:**\n```dart\nm1({@required a}) {\n  assert(a != null);\n}\n\nm2({a: 1}) {\n  assert(a != null);\n}\n```\n\nNOTE: Only asserts at the start of the bodies will be taken into account.",
    "sinceDartSdk": "wip"
  }
]
""";

void main() {
  group('allLinterRules', () {
    test('returns all linter rules non-removed or wip', () async {
      final linterRules = await allLinterRules(
        get: (url, {headers}) async => Response(
          minimalFixture,
          200,
          headers: headers ?? {},
        ),
      );

      expect(linterRules.length, 2);
    });

    test('filters rules correctly', () async {
      final linterRules = await allLinterRules(
        state: LinterRuleState.deprecated,
        get: (url, {headers}) async => Response(
          minimalFixture,
          200,
          headers: headers ?? {},
        ),
      );

      expect(linterRules.length, 1);
    });
  });
}
