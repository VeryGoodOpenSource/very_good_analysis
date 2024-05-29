import 'package:html/parser.dart' show parse;

import 'package:http/http.dart';

/// The [Uri] to fetch all linter rules from.
final _allLinterRulesUri = Uri.parse('https://dart.dev/tools/linter-rules/all');

/// Fetches all linter rules currently available in the Dart Language.
///
/// It reads and scrapes from the auto-generated file at [_allLinterRulesUri].
///
/// All linter rules are expected to be lowercased and snake_cased, see the
/// document at [_allLinterRulesUri] for reference.
Future<Iterable<String>> allLinterRules() async {
  final response = await get(_allLinterRulesUri);

  final document = parse(response.body);

  final lines = document.querySelectorAll('.line');
  return lines.where((element) {
    return element.children.length == 2 &&
        element.children[0].text.trim() == '-';
  }).map((element) {
    return element.children[1].text;
  });
}
