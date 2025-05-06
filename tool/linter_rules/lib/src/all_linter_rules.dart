import 'dart:convert';

import 'package:http/http.dart';

/// The [Uri] to fetch all linter rules from.
final _allLinterRulesUri = Uri.parse(
  'https://raw.githubusercontent.com/dart-lang/sdk/main/pkg/linter/tool/machine/rules.json',
);

/// Fetches all linter rules names currently available in the Dart Language.
///
/// It reads and parses from a JSON file at [_allLinterRulesUri].
///
/// Those linter rules that have been removed are not included in the list.
/// In addition, those linter rules that are related to a Dart SDK that is
/// working in progress are also not included.
Future<Iterable<String>> allLinterRules() async {
  final response = await get(_allLinterRulesUri);

  final data =
      (jsonDecode(response.body) as List<dynamic>)
        ..removeWhere((data) {
          final rule = data as Map<String, dynamic>;
          final state = rule['state'] as String;
          return state == 'removed';
        })
        ..removeWhere((data) {
          final rule = data as Map<String, dynamic>;
          final sdk = rule['sinceDartSdk'] as String;
          return sdk.contains('wip');
        });

  return data.map((data) {
    final rule = data as Map<String, dynamic>;
    return rule['name'] as String;
  });
}
