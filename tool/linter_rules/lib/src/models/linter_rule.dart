import 'package:meta/meta.dart';

/// {@template LinterRuleState}
/// The state of a [LinterRule] describing its present state within the Dart
/// language.
/// {@endtemplate}
enum LinterRuleState {
  /// The rule is stable.
  stable,

  /// The rule has been removed from the Dart language.
  removed,

  /// The rule is currently experimental within the Dart language.
  experimental,

  /// The rule is deprecated and should not be used.
  deprecated;

  /// Converts a [String] value to a [LinterRuleState].
  static LinterRuleState _fromJson(String value) {
    switch (value) {
      case 'stable':
        return LinterRuleState.stable;
      case 'removed':
        return LinterRuleState.removed;
      case 'experimental':
        return LinterRuleState.experimental;
      case 'deprecated':
        return LinterRuleState.deprecated;
      default:
        throw ArgumentError('Invalid value for LinterRuleState: $value');
    }
  }
}

/// {@template FixStatus}
/// Wether there is an automated fix available for the rule.
/// {@endtemplate}
enum FixStatus {
  /// The rule has an automated fix available.
  hasFix,

  /// The rule has no automated fix available.
  noFix,

  /// The rule can have an automated fix available, but is yet to be
  /// implemented.
  needsFix,

  /// The automated fix for the rule needs evaluation.
  needsEvaluation;

  /// Converts a [String] value to a [FixStatus].
  static FixStatus _fromJson(String value) {
    switch (value) {
      case 'hasFix':
        return FixStatus.hasFix;
      case 'noFix':
        return FixStatus.noFix;
      case 'needsFix':
        return FixStatus.needsFix;
      case 'needsEvaluation':
        return FixStatus.needsEvaluation;
      default:
        throw ArgumentError('Invalid value for FixStatus: $value');
    }
  }
}

/// {@template LinterRule}
/// A linter rule within the Dart language.
///
/// See also:
/// * [Available linter rules](https://raw.githubusercontent.com/dart-lang/sdk/main/pkg/linter/tool/machine/rules.json)
/// * [All linter ruels]https://github.com/dart-lang/site-www/blob/17ccab9e54d0166753c088651a98a5b6e78c1078/src/_data/linter_rules.json#L1764).
/// {@endtemplate}
@immutable
class LinterRule {
  /// {@macro LinterRule}
  const LinterRule({
    required this.name,
    required this.description,
    required this.details,
    required this.categories,
    required this.state,
    required this.incompatible,
    required this.sets,
    required this.fixStatus,
    required this.sinceDartSdk,
  });

  /// Converts JSON to a [LinterRule].
  factory LinterRule.fromJson(Map<String, dynamic> json) {
    return LinterRule(
      name: json['name'] as String,
      description: json['description'] as String,
      details: json['details'] as String,
      categories: (json['categories'] as List).cast<String>(),
      state: LinterRuleState._fromJson(json['state'] as String),
      incompatible: (json['incompatible'] as List).cast<String>(),
      sets: (json['sets'] as List).cast<String>(),
      fixStatus: FixStatus._fromJson(json['fixStatus'] as String),
      sinceDartSdk: json['sinceDartSdk'] as String,
    );
  }

  /// The unique name of the linter rule.
  final String name;

  /// A brief description of the linter rule explaining what it does.
  final String description;

  /// A detailed explanation of the linter rule.
  final String details;

  /// Categories that the rule falls into.
  ///
  /// Examples include `style`, `errorProne`, `flutter`.
  final List<String> categories;

  /// {@macro LinterRuleState}
  final LinterRuleState state;

  /// Rules that are incompatible with this rule.
  final List<String> incompatible;

  /// The sets this rule belongs to.
  ///
  /// Examples include `core`, `recommended`, `flutter`.
  final List<String> sets;

  /// {@macro FixStatus}
  final FixStatus fixStatus;

  /// The Dart SDK version when the rule was introduced.
  final String sinceDartSdk;
}
