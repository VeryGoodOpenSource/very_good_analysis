// The following syntax deactivates a lint for the entire file:
// ignore_for_file: avoid_print

void main() {
  /// The following line would normally show a lint warning
  /// but we can disable the lint rule for this line using the following syntax.
  var greeting = 'hello world'; // ignore: prefer_final_locals

  /// The following line would normally show a lint warning
  /// but we can disable the lint rule for this file using `ignore_for_file`.
  print(greeting);
}
