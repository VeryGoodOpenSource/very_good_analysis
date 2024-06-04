# Linter Rules Tool ⚙️

Tools that help maintain Very Good Analysis rules.

## Exclusion Reason Table 🗞️👨‍⚖️

For each rule that is not enabled by default by Very Good Analysis, we create a table with the rule name and the reason on why it is not enabled by default, in the following format:

```md
| Rule Name | Reason  |
| --------- | ------- |
| rule1     | Reason1 |
```

The reasons are defined in the [`exclusion_reasons.json`](exclusion_reasons.json) file, where each rule that is not enabled by default has an entry with its rule name and the reason why it is not enabled by default.

### Usage

To generate the exclusion reason table, run the following command (from tool/linter_rules):

```sh
dart lib/exclusion_reason_table.dart $version
```

This command will log the markdown table for the rules that are not enabled by default in the specified `$version` of Very Good Analysis. The `$version` is a user specified argument and it should be in the format `x.y.z`.

Those rules that are missing a reason in the `exclusion_reasons.json` file will be added to the `exclusion_reasons.json` file with the reason `Not specified`.
