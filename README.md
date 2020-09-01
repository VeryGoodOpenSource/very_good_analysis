# Very Good Analysis

[![pub package](https://img.shields.io/pub/v/very_good_analysis.svg)](https://pub.dartlang.org/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis][badge]][badge_link]

This package provides Dart linter rules which are used at [Very Good Ventures](https://verygood.ventures).

**Note**: This package is heavily inspired by and has a dependency on [pedantic](https://github.com/dart-lang/pedantic).

## Usage

To use the lints, add a dependency in your `pubspec.yaml`:

```yaml
# If you use `package:very_good_analysis/very_good_analysis.dart`, add a normal dependency.
dependencies:
  very_good_analysis: ^1.0.0

# Or, if you just want `analysis_options.yaml`, it can be a dev dependency.
dev_dependencies:
  very_good_analysis: ^1.0.0
```

Then, add an include in `analysis_options.yaml`:

```yaml
include: package:very_good_analysis/analysis_options.yaml
```

This will ensure you always use the latest version of the lints. If you wish to restrict the lint version, specify a version of `analysis_options.yaml` instead:

```yaml
include: package:very_good_analysis/analysis_options.1.0.0.yaml
```

## Suppressing Lints

There may be cases where specific lint rules are undesirable. Lint rules can be surpressed at the line, file, or project level.

An example use case for suppressing lint rules at the file level is suppressing the `prefer_const_constructors` in order to achieve 100% code coverage. This is due to the fact that const constructors are executed before the tests are run, resulting in no coverage collection.

Suppressing lint rules should be done only in a handful of circumstances when absolutely necessary. **They should be justified to the project lead beforehand.**

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

[very good analysis]: https://github.com/VGVentures/very_good_analysis
[badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[badge_link]: https://pub.dev/packages/very_good_analysis
