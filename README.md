# Very Good Analysis

[![Very Good Ventures](https://raw.githubusercontent.com/VeryGoodOpenSource/very_good_analysis/main/assets/vgv_logo.png)][very_good_ventures_link]

Developed with 💙 by [Very Good Ventures][very_good_ventures_link] 🦄

[![ci][ci_badge]][ci_badge_link]
[![pub package][pub_badge]][pub_badge_link]
[![License: MIT][license_badge]][license_badge_link]
[![style: very good analysis][badge]][badge_link]

---

This package provides lint rules for Dart and Flutter which are used at [Very Good Ventures][very_good_ventures_link]. For more information, see the [complete list of options][analysis_options_yaml].

**Note**: This package was heavily inspired by [pedantic][pedantic_link].

## Usage

To use the lints, add a dependency in your `pubspec.yaml`:

```yaml
# If you use `package:very_good_analysis/very_good_analysis.dart`, add a normal dependency.
dependencies:
  very_good_analysis: ^2.3.0

# Or, if you just want `analysis_options.yaml`, it can be a dev dependency.
dev_dependencies:
  very_good_analysis: ^2.3.0
```

Then, add an include in `analysis_options.yaml`:

```yaml
include: package:very_good_analysis/analysis_options.yaml
```

This will ensure you always use the latest version of the lints. If you wish to restrict the lint version, specify a version of `analysis_options.yaml` instead:

```yaml
include: package:very_good_analysis/analysis_options.2.3.0.yaml
```

## Suppressing Lints

There may be cases where specific lint rules are undesirable. Lint rules can be surpressed at the line, file, or project level.

An example use case for suppressing lint rules at the file level is suppressing the `prefer_const_constructors` in order to achieve 100% code coverage. This is due to the fact that const constructors are executed before the tests are run, resulting in no coverage collection.

### Line Level

To surpress a specific lint rule for a specific line of code, use an `ignore` comment directly above the line:

```dart
// ignore: public_member_api_docs
class A {}
```

### File Level

To surpress a specific lint rule of a specific file, use an `ignore_for_file` comment at the top of the file:

```dart
// ignore_for_file: public_member_api_docs

class A {}

class B {}
```

### Project Level

To surpress a specific lint rule for an entire project, modify `analysis_options.yaml`:

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

[analysis_options_yaml]: https://github.com/VeryGoodOpenSource/very_good_analysis/blob/main/analysis_options.yaml
[ci_badge]: https://github.com/VeryGoodOpenSource/very_good_analysis/workflows/ci/badge.svg
[ci_badge_link]: https://github.com/VeryGoodOpenSource/very_good_analysis/actions
[badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[badge_link]: https://pub.dev/packages/very_good_analysis
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_badge_link]: https://opensource.org/licenses/MIT
[pedantic_link]: https://github.com/dart-lang/pedantic
[pub_badge]: https://img.shields.io/pub/v/very_good_analysis.svg
[pub_badge_link]: https://pub.dartlang.org/packages/very_good_analysis
[very_good_ventures_link]: https://verygood.ventures
