import 'package:very_good_analysis/very_good_analysis.dart';

void main() async {
  /// Await async functions.
  await asyncFunction();

  /// Use [unawaited] to indicate that a [Future] is intentionally not awaited.
  /// Otherwise you'll get a warning
  unawaited(asyncFunction());
}

Future<String> asyncFunction() {
  return Future.value('hello world!');
}
