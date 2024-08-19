# Very Good Analysis

[![Very Good Ventures][logo_black]][very_good_ventures_link_light]
[![Very Good Ventures][logo_white]][very_good_ventures_link_dark]

Developed with 💙 by [Very Good Ventures][very_good_ventures_link] 🦄

[![ci][ci_badge]][ci_badge_link]
[![pub package][pub_badge]][pub_badge_link]
[![License: MIT][license_badge]][license_badge_link]
[![style: very good analysis][badge]][badge_link]

---

This package provides lint rules for Dart and Flutter which are used at [Very Good Ventures][very_good_ventures_link]. For more information, see the [complete list of options][analysis_options_yaml].

**Note**: This package was heavily inspired by [pedantic][pedantic_link].

## Usage

To use the lints, add as a dev dependency in your `pubspec.yaml`:

```yaml
dart pub add dev:very_good_analysis
# or
flutter pub add dev:very_good_analysis
```

Then, add an include in `analysis_options.yaml`:

```yaml
include: package:very_good_analysis/analysis_options.yaml
```

This will ensure you always use the latest version of the lints. If you wish to restrict the lint version, specify a version of `analysis_options.yaml` instead:

```yaml
include: package:very_good_analysis/analysis_options.7.0.0.yaml
```

## Suppressing Lints

There may be cases where specific lint rules are undesirable. Lint rules can be suppressed at the line, file, or project level.

An example use case for suppressing lint rules at the file level is suppressing the `prefer_const_constructors` in order to achieve 100% code coverage. This is due to the fact that const constructors are executed before the tests are run, resulting in no coverage collection.

### Line Level

To suppress a specific lint rule for a specific line of code, use an `ignore` comment directly above the line:

```dart
// ignore: public_member_api_docs
class A {}
```

### File Level

To suppress a specific lint rule of a specific file, use an `ignore_for_file` comment at the top of the file:

```dart
// ignore_for_file: public_member_api_docs

class A {}

class B {}
```

### Project Level

To suppress a specific lint rule for an entire project, modify `analysis_options.yaml`:

```yaml
include: package:very_good_analysis/analysis_options.yaml
linter:
  rules:
    public_member_api_docs: false
```

## Badge

To indicate your project is using `very_good_analysis` →
[![style: very good analysis][badge]][badge_link]

```md
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
```

## Excluded rules

Below is a list of rules that are not enabled by default together with the reason on why they have been excluded:

<!-- start:excluded_rules_table -->

| Rule                                                                                                                                                       | Reason                                                                                                                       |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| [`always_put_control_body_on_new_line`](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line)                                           | [Can conflict with the Dart formatter](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line)              |
| [`always_specify_types`](https://dart.dev/tools/linter-rules/always_specify_types)                                                                         | Incompatible with [omit_local_variable_types](https://dart.dev/tools/linter-rules/omit_local_variable_types)                 |
| [`annotate_redeclares`](https://dart.dev/tools/linter-rules/annotate_redeclares)                                                                           | Experimental                                                                                                                 |
| [`avoid_annotating_with_dynamic`](https://dart.dev/tools/linter-rules/avoid_annotating_with_dynamic)                                                       | Not specified                                                                                                                |
| [`avoid_catches_without_on_clauses`](https://dart.dev/tools/linter-rules/avoid_catches_without_on_clauses)                                                 | [Has unresolved false positives](https://github.com/dart-lang/linter/issues/3023)                                            |
| [`avoid_classes_with_only_static_members`](https://dart.dev/tools/linter-rules/avoid_classes_with_only_static_members)                                     | Not specified                                                                                                                |
| [`avoid_implementing_value_types`](https://dart.dev/tools/linter-rules/avoid_implementing_value_types)                                                     | Not specified                                                                                                                |
| [`avoid_types_on_closure_parameters`](https://dart.dev/tools/linter-rules/avoid_types_on_closure_parameters)                                               | Not specified                                                                                                                |
| [`close_sinks`](https://dart.dev/tools/linter-rules/close_sinks)                                                                                           | [Has unresolved false positives](https://github.com/dart-lang/linter/issues/1381)                                            |
| [`deprecated_member_use_from_same_package`](https://dart.dev/tools/linter-rules/deprecated_member_use_from_same_package)                                   | Not specified                                                                                                                |
| [`diagnostic_describe_all_properties`](https://dart.dev/tools/linter-rules/diagnostic_describe_all_properties)                                             | Not specified                                                                                                                |
| [`discarded_futures`](https://dart.dev/tools/linter-rules/discarded_futures)                                                                               | [Has unresolved false positives](https://github.com/VeryGoodOpenSource/very_good_analysis/issues/74#issuecomment-1668425410) |
| [`do_not_use_environment`](https://dart.dev/tools/linter-rules/do_not_use_environment)                                                                     | Not specified                                                                                                                |
| [`document_ignores`](https://dart.dev/tools/linter-rules/document_ignores)                                                                                 | Not specified                                                                                                                |
| [`invalid_runtime_check_with_js_interop_types`](https://dart.dev/tools/linter-rules/invalid_runtime_check_with_js_interop_types)                           | [Pending recommendation](https://github.com/dart-lang/lints/issues/188)                                                      |
| [`matching_super_parameters`](https://dart.dev/tools/linter-rules/matching_super_parameters)                                                               | Not specified                                                                                                                |
| [`no_literal_bool_comparisons`](https://dart.dev/tools/linter-rules/no_literal_bool_comparisons)                                                           | Not specified                                                                                                                |
| [`prefer_double_quotes`](https://dart.dev/tools/linter-rules/prefer_double_quotes)                                                                         | Incompatible with [prefer_single_quotes](https://dart.dev/tools/linter-rules/prefer_single_quotes)                           |
| [`prefer_expression_function_bodies`](https://dart.dev/tools/linter-rules/prefer_expression_function_bodies)                                               | Not specified                                                                                                                |
| [`prefer_final_parameters`](https://dart.dev/tools/linter-rules/prefer_final_parameters)                                                                   | Incompatible with [avoid_final_parameters](https://dart.dev/tools/linter-rules/avoid_final_parameters)                       |
| [`prefer_foreach`](https://dart.dev/tools/linter-rules/prefer_foreach)                                                                                     | Not specified                                                                                                                |
| [`prefer_mixin`](https://dart.dev/tools/linter-rules/prefer_mixin)                                                                                         | Not specified                                                                                                                |
| [`prefer_relative_imports`](https://dart.dev/tools/linter-rules/prefer_relative_imports)                                                                   | Incompatible with [always_use_package_imports](https://dart.dev/tools/linter-rules/always_use_package_imports)               |
| [`type_literal_in_constant_pattern`](https://dart.dev/tools/linter-rules/type_literal_in_constant_pattern)                                                 | Not specified                                                                                                                |
| [`unintended_html_in_doc_comment`](https://dart.dev/tools/linter-rules/unintended_html_in_doc_comment)                                                     | [Pending recommendation](https://github.com/dart-lang/lints/issues/192)                                                      |
| [`unnecessary_final`](https://dart.dev/tools/linter-rules/unnecessary_final)                                                                               | Incompatible with [prefer_final_locals](https://dart.dev/tools/linter-rules/prefer_final_locals)                             |
| [`unnecessary_library_name`](https://dart.dev/tools/linter-rules/unnecessary_library_name)                                                                 | [Pending recommendation](https://github.com/dart-lang/lints/issues/181)                                                      |
| [`unnecessary_null_aware_operator_on_extension_on_nullable`](https://dart.dev/tools/linter-rules/unnecessary_null_aware_operator_on_extension_on_nullable) | Not specified                                                                                                                |
| [`unreachable_from_main`](https://dart.dev/tools/linter-rules/unreachable_from_main)                                                                       | Not specified                                                                                                                |
| [`unsafe_html`](https://dart.dev/tools/linter-rules/unsafe_html)                                                                                           | Not specified                                                                                                                |
| [`use_decorated_box`](https://dart.dev/tools/linter-rules/use_decorated_box)                                                                               | [Has unresolved malfunctions](https://github.com/dart-lang/linter/issues/3286)                                               |

<!-- end:excluded_rules_table -->

[analysis_options_yaml]: https://github.com/VeryGoodOpenSource/very_good_analysis/blob/main/lib/analysis_options.7.0.0.yaml
[ci_badge]: https://github.com/VeryGoodOpenSource/very_good_analysis/workflows/ci/badge.svg
[ci_badge_link]: https://github.com/VeryGoodOpenSource/very_good_analysis/actions
[badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[badge_link]: https://pub.dev/packages/very_good_analysis
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_badge_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[pedantic_link]: https://github.com/dart-lang/pedantic
[pub_badge]: https://img.shields.io/pub/v/very_good_analysis.svg
[pub_badge_link]: https://pub.dartlang.org/packages/very_good_analysis
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
