# Linter Rules Tool ⚙️

Tools that help maintain Very Good Analysis rules.

## Exclusion Reason Table 🗞️👨‍⚖️

For each rule that is not enabled by default by Very Good Analysis, we create a table with the rule name and the reason on why it is not enabled by default, in the following format:

```md
| Rule Name | Reason  |
| --------- | ------- |
| rule1     | Reason1 |
```

The reasons are defined in the [`exclusion_reasons.json`](exclusion_reasons.json) file, where each rule that is not enabled by default has an entry with its rule name and the reason on why it is not enabled by default.

### Usage

To generate the exclusion reason table, run the following command (from `tool/linter_rules`, and don't forget to `dart pub get`):

```sh
dart lib/exclusion_reason_table.dart
```

This command will update the README table for the rules that are not enabled by default in the specified `$version` of Very Good Analysis.

In addition, no longer excluded rules will be removed from the `exclusion_reasons.json` file. The command does not format the output, so it is recommended to format both files with your preferred formatter after running the command.

Rules that are missing a reason in the `exclusion_reasons.json` file will be given the reason `Not specified`.

### Options

| Option              | Description                                                           | Default                                 |
| ------------------- | --------------------------------------------------------------------- | --------------------------------------- |
| version             | The Very Good Analysis version to use.                                | latest (from lib/analysis_options.yaml) |
| set-exit-if-changed | Set the exit code to 2 if there are changes to the exclusion reasons. | false                                   |


## Analyze 🔍

If you're looking to update Very Good Analysis you might want to analyze the health of the latest rule set. You can use the script at `bin/analyze.dart` to do exactly that.

It will log information about:

- The number of Dart linter rules fetched.
- The number of rules being declared in the given Very Good Analysis with the given version.
- The number of deprecated rules Dart rules being used in Very Good Analysis with the given version.

### Usage

To run the `analyze` script, run the following command (from `tool/linter_rules`, and don't forget to `dart pub get`):

```sh
# This will analyze the latest version of Very Good Analysis
dart bin/analyze.dart
```

The script also accepts a specific version as an argument to analyze:

```sh
dart bin/analyze.dart $version
```

Where version is the existing Very Good Analysis version you would like to analyze, for example `9.0.0`.
