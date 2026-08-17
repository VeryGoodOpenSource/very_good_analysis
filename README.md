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
include: package:very_good_analysis/analysis_options.10.0.0.yaml
```

## Formatter

In addition to lint rules, this package configures the Dart [formatter][dart_format_link]. Trailing commas are set to `automate`, which lets the formatter decide when to add or remove trailing commas to keep code readable:

```yaml
formatter:
  trailing_commas: automate
```

If you prefer to manage trailing commas yourself, override this setting in your `analysis_options.yaml`:

```yaml
include: package:very_good_analysis/analysis_options.yaml
formatter:
  trailing_commas: preserve
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
| Rule | Reason |
| --- | --- |
| [`always_put_control_body_on_new_line`](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line) | [Can conflict with the Dart formatter](https://dart.dev/tools/linter-rules/always_put_control_body_on_new_line) |
| [`always_specify_types`](https://dart.dev/tools/linter-rules/always_specify_types) | Incompatible with [omit_local_variable_types](https://dart.dev/tools/linter-rules/omit_local_variable_types) |
| [`annotate_redeclares`](https://dart.dev/tools/linter-rules/annotate_redeclares) | Experimental |
| [`async_return_with_no_await`](https://dart.dev/tools/linter-rules/async_return_with_no_await) | Not specified |
| [`avoid_annotating_with_dynamic`](https://dart.dev/tools/linter-rules/avoid_annotating_with_dynamic) | Not specified |
| [`avoid_classes_with_only_static_members`](https://dart.dev/tools/linter-rules/avoid_classes_with_only_static_members) | Not specified |
| [`avoid_futureor_void`](https://dart.dev/tools/linter-rules/avoid_futureor_void) | Experimental |
| [`avoid_implementing_value_types`](https://dart.dev/tools/linter-rules/avoid_implementing_value_types) | We need to implement value types for mocks/fakes in tests |
| [`avoid_null_checks_in_equality_operators`](https://dart.dev/tools/linter-rules/avoid_null_checks_in_equality_operators) | Has been deprecated and [will be removed](https://github.com/dart-lang/sdk/issues/59514) |
| [`avoid_private_typedef_functions`](https://dart.dev/tools/linter-rules/avoid_private_typedef_functions) | Deprecated |
| [`close_sinks`](https://dart.dev/tools/linter-rules/close_sinks) | [Has unresolved false positives](https://github.com/dart-lang/linter/issues/1381) |
| [`diagnostic_describe_all_properties`](https://dart.dev/tools/linter-rules/diagnostic_describe_all_properties) | Not specified |
| [`do_not_use_environment`](https://dart.dev/tools/linter-rules/do_not_use_environment) | Not specified |
| [`initialize_in_field_declaration`](https://dart.dev/tools/linter-rules/initialize_in_field_declaration) | Not specified |
| [`library_names`](https://dart.dev/tools/linter-rules/library_names) | [Superseded by `unnecessary_library_name`](https://github.com/dart-lang/lints/issues/172) |
| [`no_dynamic_casts`](https://dart.dev/tools/linter-rules/no_dynamic_casts) | Not specified |
| [`no_raw_types`](https://dart.dev/tools/linter-rules/no_raw_types) | Not specified |
| [`no_runtimetype_tostring`](https://dart.dev/tools/linter-rules/no_runtimetype_tostring) | Not specified |
| [`omit_obvious_local_variable_types`](https://dart.dev/tools/linter-rules/omit_obvious_local_variable_types) | Experimental |
| [`omit_obvious_property_types`](https://dart.dev/tools/linter-rules/omit_obvious_property_types) | Incompatible with [type_annotate_public_apis](https://github.com/dart-lang/sdk/issues/60642) |
| [`one_member_abstracts`](https://dart.dev/tools/linter-rules/one_member_abstracts) | Deprecated |
| [`package_prefixed_library_names`](https://dart.dev/tools/linter-rules/package_prefixed_library_names) | [Broken; superseded by `unnecessary_library_name`](https://github.com/dart-lang/lints/issues/172) |
| [`prefer_double_quotes`](https://dart.dev/tools/linter-rules/prefer_double_quotes) | Incompatible with [prefer_single_quotes](https://dart.dev/tools/linter-rules/prefer_single_quotes) |
| [`prefer_expression_function_bodies`](https://dart.dev/tools/linter-rules/prefer_expression_function_bodies) | Not specified |
| [`prefer_final_parameters`](https://dart.dev/tools/linter-rules/prefer_final_parameters) | Incompatible with [avoid_final_parameters](https://dart.dev/tools/linter-rules/avoid_final_parameters) |
| [`prefer_for_elements_to_map_fromiterable`](https://dart.dev/tools/linter-rules/prefer_for_elements_to_map_fromiterable) | Not specified |
| [`prefer_iterable_wheretype`](https://dart.dev/tools/linter-rules/prefer_iterable_wheretype) | Not specified |
| [`prefer_relative_imports`](https://dart.dev/tools/linter-rules/prefer_relative_imports) | Incompatible with [always_use_package_imports](https://dart.dev/tools/linter-rules/always_use_package_imports) |
| [`prefer_void_to_null`](https://dart.dev/tools/linter-rules/prefer_void_to_null) | [Has unresolved false positives](https://github.com/dart-lang/linter/issues/4758) |
| [`specify_nonobvious_local_variable_types`](https://dart.dev/tools/linter-rules/specify_nonobvious_local_variable_types) | Experimental |
| [`unnecessary_async`](https://dart.dev/tools/linter-rules/unnecessary_async) | Experimental |
| [`unnecessary_await_in_return`](https://dart.dev/tools/linter-rules/unnecessary_await_in_return) | Deprecated |
| [`unnecessary_const_in_enum_constructor`](https://dart.dev/tools/linter-rules/unnecessary_const_in_enum_constructor) | Not specified |
| [`unnecessary_final`](https://dart.dev/tools/linter-rules/unnecessary_final) | Incompatible with [prefer_final_locals](https://dart.dev/tools/linter-rules/prefer_final_locals) |
| [`unnecessary_type_name_in_constructor`](https://dart.dev/tools/linter-rules/unnecessary_type_name_in_constructor) | Not specified |
| [`unreachable_from_main`](https://dart.dev/tools/linter-rules/unreachable_from_main) | Not specified |
| [`unsafe_variance`](https://dart.dev/tools/linter-rules/unsafe_variance) | Experimental |
| [`use_declaring_parameters`](https://dart.dev/tools/linter-rules/use_declaring_parameters) | Not specified |
| [`use_decorated_box`](https://dart.dev/tools/linter-rules/use_decorated_box) | [Has unresolved malfunctions](https://github.com/dart-lang/linter/issues/3286) |
| [`use_if_null_to_convert_nulls_to_bools`](https://dart.dev/tools/linter-rules/use_if_null_to_convert_nulls_to_bools) | Not specified |
| [`use_primary_constructors`](https://dart.dev/tools/linter-rules/use_primary_constructors) | Not specified |
| [`var_with_no_type_annotation`](https://dart.dev/tools/linter-rules/var_with_no_type_annotation) | Not specified |
<!-- end:excluded_rules_table -->

[analysis_options_yaml]: https://github.com/VeryGoodOpenSource/very_good_analysis/blob/main/lib/analysis_options.10.0.0.yaml
[ci_badge]: https://github.com/VeryGoodOpenSource/very_good_analysis/workflows/ci/badge.svg
[dart_format_link]: https://dart.dev/tools/dart-format
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
