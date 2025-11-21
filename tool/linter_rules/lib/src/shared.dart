/// The [Uri] to fetch all linter rules from.
final Uri allLinterRulesUri = Uri.parse(
  'https://raw.githubusercontent.com/dart-lang/sdk/main/pkg/linter/tool/machine/rules.json',
);

/// Returns the link to the documentation for the given linter [rule].
String linterRuleLink(String rule) =>
    'https://dart.dev/tools/linter-rules/$rule';

/// The tag delimiting the start and end of the excluded rules table in the
/// README.md file.
const excludedRulesTableTag = (
  '<!-- start:excluded_rules_table -->',
  '<!-- end:excluded_rules_table -->',
);
