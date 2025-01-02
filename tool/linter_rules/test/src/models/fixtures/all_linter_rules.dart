/// The fixture for the `all_linter_rules.json` file.
///
/// The content is a copy from the [all_linter_rules.json file](https://raw.githubusercontent.com/dart-lang/site-www/17ccab9e54d0166753c088651a98a5b6e78c1078/src/_data/linter_rules.json).
///
/// Yo may find the latest file within the [Dart Language Repository](https://github.com/dart-lang/site-www/blob/17ccab9e54d0166753c088651a98a5b6e78c1078/src/_data/linter_rules.json#L1764).
const allLinterRulesFixute = r"""
[
  {
    "name": "always_declare_return_types",
    "description": "Declare method return types.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** declare method return types.\n\nWhen declaring a method or function *always* specify a return type.\nDeclaring return types for functions helps improve your codebase by allowing the\nanalyzer to more adequately check your code for errors that could occur during\nruntime.\n\n**BAD:**\n```dart\nmain() { }\n\n_bar() => _Foo();\n\nclass _Foo {\n  _foo() => 42;\n}\n```\n\n**GOOD:**\n```dart\nvoid main() { }\n\n_Foo _bar() => _Foo();\n\nclass _Foo {\n  int _foo() => 42;\n}\n\ntypedef predicate = bool Function(Object o);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_put_control_body_on_new_line",
    "description": "Separate the control structure expression from its statement.",
    "categories": [
      "errorProne",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "From the [style guide for the flutter repo](https://flutter.dev/style-guide/):\n\n**DO** separate the control structure expression from its statement.\n\nDon't put the statement part of an `if`, `for`, `while`, `do` on the same line\nas the expression, even if it is short.  Doing so makes it unclear that there\nis relevant code there.  This is especially important for early returns.\n\n**BAD:**\n```dart\nif (notReady) return;\n\nif (notReady)\n  return;\nelse print('ok')\n\nwhile (condition) i += 1;\n```\n\n**GOOD:**\n```dart\nif (notReady)\n  return;\n\nif (notReady)\n  return;\nelse\n  print('ok')\n\nwhile (condition)\n  i += 1;\n```\n\nNote that this rule can conflict with the\n[Dart formatter](https://dart.dev/tools/dart-format), and should not be enabled\nwhen the Dart formatter is used.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_put_required_named_parameters_first",
    "description": "Put required named parameters first.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** specify `required` on named parameter before other named parameters.\n\n**BAD:**\n```dart\nm({b, c, required a}) ;\n```\n\n**GOOD:**\n```dart\nm({required a, b, c}) ;\n```\n\n**BAD:**\n```dart\nm({b, c, @required a}) ;\n```\n\n**GOOD:**\n```dart\nm({@required a, b, c}) ;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_require_non_null_named_parameters",
    "description": "Specify `@required` on named parameters without defaults.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.3.0; it is no longer functional.\n\n**DO** specify `@required` on named parameters without a default value on which\nan `assert(param != null)` is done.\n\n**BAD:**\n```dart\nm1({a}) {\n  assert(a != null);\n}\n```\n\n**GOOD:**\n```dart\nm1({@required a}) {\n  assert(a != null);\n}\n\nm2({a: 1}) {\n  assert(a != null);\n}\n```\n\nNOTE: Only asserts at the start of the bodies will be taken into account.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_specify_types",
    "description": "Specify type annotations.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "avoid_types_on_closure_parameters",
      "omit_local_variable_types",
      "omit_obvious_local_variable_types"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "From the [style guide for the flutter repo](https://flutter.dev/style-guide/):\n\n**DO** specify type annotations.\n\nAvoid `var` when specifying that a type is unknown and short-hands that elide\ntype annotations.  Use `dynamic` if you are being explicit that the type is\nunknown.  Use `Object` if you are being explicit that you want an object that\nimplements `==` and `hashCode`.\n\n**BAD:**\n```dart\nvar foo = 10;\nfinal bar = Bar();\nconst quux = 20;\n```\n\n**GOOD:**\n```dart\nint foo = 10;\nfinal Bar bar = Bar();\nString baz = 'hello';\nconst int quux = 20;\n```\n\nNOTE: Using the the `@optionalTypeArgs` annotation in the `meta` package, API\nauthors can special-case type parameters whose type needs to be dynamic but whose\ndeclaration should be treated as optional.  For example, suppose you have a\n`Key` object whose type parameter you'd like to treat as optional.  Using the\n`@optionalTypeArgs` would look like this:\n\n```dart\nimport 'package:meta/meta.dart';\n\n@optionalTypeArgs\nclass Key<T> {\n ...\n}\n\nvoid main() {\n  Key s = Key(); // OK!\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "always_use_package_imports",
    "description": "Avoid relative imports for files in `lib/`.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [
      "prefer_relative_imports"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** avoid relative imports for files in `lib/`.\n\nWhen mixing relative and absolute imports it's possible to create confusion\nwhere the same member gets imported in two different ways. One way to avoid\nthat is to ensure you consistently use absolute imports for files within the\n`lib/` directory.\n\nThis is the opposite of 'prefer_relative_imports'.\n\nYou can also use 'avoid_relative_lib_imports' to disallow relative imports of\nfiles within `lib/` directory outside of it (for example `test/`).\n\n**BAD:**\n```dart\nimport 'baz.dart';\n\nimport 'src/bag.dart'\n\nimport '../lib/baz.dart';\n\n...\n```\n\n**GOOD:**\n```dart\nimport 'package:foo/bar.dart';\n\nimport 'package:foo/baz.dart';\n\nimport 'package:foo/src/baz.dart';\n...\n```",
    "sinceDartSdk": "2.10"
  },
  {
    "name": "annotate_overrides",
    "description": "Annotate overridden members.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** annotate overridden methods and fields.\n\nThis practice improves code readability and helps protect against\nunintentionally overriding superclass members.\n\n**BAD:**\n```dart\nclass Cat {\n  int get lives => 9;\n}\n\nclass Lucky extends Cat {\n  final int lives = 14;\n}\n```\n\n**GOOD:**\n```dart\nabstract class Dog {\n  String get breed;\n  void bark() {}\n}\n\nclass Husky extends Dog {\n  @override\n  final String breed = 'Husky';\n  @override\n  void bark() {}\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "annotate_redeclares",
    "description": "Annotate redeclared members.",
    "categories": [
      "style"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** annotate redeclared members.\n\nThis practice improves code readability and helps protect against\nunintentionally redeclaring members or being surprised when a member ceases to\nredeclare (due for example to a rename refactoring).\n\n**BAD:**\n```dart\nclass C {\n  void f() { }\n}\n\nextension type E(C c) implements C {\n  void f() {\n    ...\n  }\n}\n```\n\n**GOOD:**\n```dart\nimport 'package:meta/meta.dart';\n\nclass C {\n  void f() { }\n}\n\nextension type E(C c) implements C {\n  @redeclare\n  void f() {\n    ...\n  }\n}\n```",
    "sinceDartSdk": "3.2"
  },
  {
    "name": "avoid_annotating_with_dynamic",
    "description": "Avoid annotating with `dynamic` when not required.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**AVOID** annotating with `dynamic` when not required.\n\nAs `dynamic` is the assumed return value of a function or method, it is usually\nnot necessary to annotate it.\n\n**BAD:**\n```dart\ndynamic lookUpOrDefault(String name, Map map, dynamic defaultValue) {\n  var value = map[name];\n  if (value != null) return value;\n  return defaultValue;\n}\n```\n\n**GOOD:**\n```dart\nlookUpOrDefault(String name, Map map, defaultValue) {\n  var value = map[name];\n  if (value != null) return value;\n  return defaultValue;\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_as",
    "description": "Avoid using `as`.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule was removed from the SDK in Dart 3; it is no longer functional.\nIts advice is compiler-specific and mostly obsolete with null safety.\n\n**AVOID** using `as`.\n\nIf you know the type is correct, use an assertion or assign to a more\nnarrowly-typed variable (this avoids the type check in release mode; `as` is not\ncompiled out in release mode).  If you don't know whether the type is\ncorrect, check using `is` (this avoids the exception that `as` raises).\n\n**BAD:**\n```dart\n(pm as Person).firstName = 'Seth';\n```\n\n**GOOD:**\n```dart\nif (pm is Person)\n  pm.firstName = 'Seth';\n```\n\nbut certainly not\n\n**BAD:**\n```dart\ntry {\n   (pm as Person).firstName = 'Seth';\n} on CastError { }\n```\n\nNote that an exception is made in the case of `dynamic` since the cast has no\nperformance impact.\n\n**OK:**\n```dart\nHasScrollDirection scrollable = renderObject as dynamic;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_bool_literals_in_conditional_expressions",
    "description": "Avoid `bool` literals in conditional expressions.",
    "categories": [
      "brevity"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**AVOID** `bool` literals in conditional expressions.\n\n**BAD:**\n```dart\ncondition ? true : boolExpression\ncondition ? false : boolExpression\ncondition ? boolExpression : true\ncondition ? boolExpression : false\n```\n\n**GOOD:**\n```dart\ncondition || boolExpression\n!condition && boolExpression\n!condition || boolExpression\ncondition && boolExpression\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_catches_without_on_clauses",
    "description": "Avoid catches without on clauses.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#avoid-catches-without-on-clauses):\n\n**AVOID** catches without on clauses.\n\nUsing catch clauses without on clauses make your code prone to encountering\nunexpected errors that won't be thrown (and thus will go unnoticed).\n\n**BAD:**\n```dart\ntry {\n somethingRisky()\n} catch(e) {\n  doSomething(e);\n}\n```\n\n**GOOD:**\n```dart\ntry {\n somethingRisky()\n} on Exception catch(e) {\n  doSomething(e);\n}\n```\n\nA few exceptional cases are allowed:\n\n* If the body of the catch rethrows the exception.\n* If the caught exception is \"directly used\" in an argument to `Future.error`,\n  `Completer.completeError`, or `FlutterError.reportError`, or any function with\n  a return type of `Never`.\n* If the caught exception is \"directly used\" in a new throw-expression.\n\nIn these cases, \"directly used\" means that the exception is referenced within\nthe relevant code (like within an argument). If the exception variable is\nreferenced _before_ the relevant code, for example to instantiate a wrapper\nexception, the variable is not \"directly used.\"",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_catching_errors",
    "description": "Don't explicitly catch `Error` or types that implement it.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DON'T** explicitly catch `Error` or types that implement it.\n\nErrors differ from Exceptions in that Errors can be analyzed and prevented prior\nto runtime.  It should almost never be necessary to catch an error at runtime.\n\n**BAD:**\n```dart\ntry {\n  somethingRisky();\n} on Error catch(e) {\n  doSomething(e);\n}\n```\n\n**GOOD:**\n```dart\ntry {\n  somethingRisky();\n} on Exception catch(e) {\n  doSomething(e);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_classes_with_only_static_members",
    "description": "Avoid defining a class that contains only static members.",
    "categories": [
      "effectiveDart",
      "languageFeatureUsage",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#avoid-defining-a-class-that-contains-only-static-members):\n\n**AVOID** defining a class that contains only static members.\n\nCreating classes with the sole purpose of providing utility or otherwise static\nmethods is discouraged.  Dart allows functions to exist outside of classes for\nthis very reason.\n\n**BAD:**\n```dart\nclass DateUtils {\n  static DateTime mostRecent(List<DateTime> dates) {\n    return dates.reduce((a, b) => a.isAfter(b) ? a : b);\n  }\n}\n\nclass _Favorites {\n  static const mammal = 'weasel';\n}\n```\n\n**GOOD:**\n```dart\nDateTime mostRecent(List<DateTime> dates) {\n  return dates.reduce((a, b) => a.isAfter(b) ? a : b);\n}\n\nconst _favoriteMammal = 'weasel';\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_double_and_int_checks",
    "description": "Avoid `double` and `int` checks.",
    "categories": [
      "errorProne",
      "web"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**AVOID** to check if type is `double` or `int`.\n\nWhen compiled to JS, integer values are represented as floats. That can lead to\nsome unexpected behavior when using either `is` or `is!` where the type is\neither `int` or `double`.\n\n**BAD:**\n```dart\nf(num x) {\n  if (x is double) {\n    ...\n  } else if (x is int) {\n    ...\n  }\n}\n```\n\n**GOOD:**\n```dart\nf(dynamic x) {\n  if (x is num) {\n    ...\n  } else {\n    ...\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_dynamic_calls",
    "description": "Avoid method calls or property accesses on a `dynamic` target.",
    "categories": [
      "binarySize",
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** avoid method calls or accessing properties on an object that is either\nexplicitly or implicitly statically typed `dynamic`. Dynamic calls are treated\nslightly different in every runtime environment and compiler, but most\nproduction modes (and even some development modes) have both compile size and\nruntime performance penalties associated with dynamic calls.\n\nAdditionally, targets typed `dynamic` disables most static analysis, meaning it\nis easier to lead to a runtime `NoSuchMethodError` or `TypeError` than properly\nstatically typed Dart code.\n\nThere is an exception to methods and properties that exist on `Object?`:\n- `a.hashCode`\n- `a.runtimeType`\n- `a.noSuchMethod(someInvocation)`\n- `a.toString()`\n\n... these members are dynamically dispatched in the web-based runtimes, but not\nin the VM-based ones. Additionally, they are so common that it would be very\npunishing to disallow `any.toString()` or `any == true`, for example.\n\nNote that despite `Function` being a type, the semantics are close to identical\nto `dynamic`, and calls to an object that is typed `Function` will also trigger\nthis lint.\n\nDynamic calls are allowed on cast expressions (`as dynamic` or `as Function`).\n\n**BAD:**\n```dart\nvoid explicitDynamicType(dynamic object) {\n  print(object.foo());\n}\n\nvoid implicitDynamicType(object) {\n  print(object.foo());\n}\n\nabstract class SomeWrapper {\n  T doSomething<T>();\n}\n\nvoid inferredDynamicType(SomeWrapper wrapper) {\n  var object = wrapper.doSomething();\n  print(object.foo());\n}\n\nvoid callDynamic(dynamic function) {\n  function();\n}\n\nvoid functionType(Function function) {\n  function();\n}\n```\n\n**GOOD:**\n```dart\nvoid explicitType(Fooable object) {\n  object.foo();\n}\n\nvoid castedType(dynamic object) {\n  (object as Fooable).foo();\n}\n\nabstract class SomeWrapper {\n  T doSomething<T>();\n}\n\nvoid inferredType(SomeWrapper wrapper) {\n  var object = wrapper.doSomething<Fooable>();\n  object.foo();\n}\n\nvoid functionTypeWithParameters(Function() function) {\n  function();\n}\n```",
    "sinceDartSdk": "2.12"
  },
  {
    "name": "avoid_empty_else",
    "description": "Avoid empty statements in else clauses.",
    "categories": [
      "brevity",
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** empty statements in the `else` clause of `if` statements.\n\n**BAD:**\n```dart\nif (x > y)\n  print('1');\nelse ;\n  print('2');\n```\n\nIf you want a statement that follows the empty clause to _conditionally_ run,\nremove the dangling semicolon to include it in the `else` clause.\nOptionally, also enclose the else's statement in a block.\n\n**GOOD:**\n```dart\nif (x > y)\n  print('1');\nelse\n  print('2');\n```\n\n**GOOD:**\n```dart\nif (x > y) {\n  print('1');\n} else {\n  print('2');\n}\n```\n\nIf you want a statement that follows the empty clause to _unconditionally_ run,\nremove the `else` clause.\n\n**GOOD:**\n```dart\nif (x > y) print('1');\n\nprint('2');\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_equals_and_hash_code_on_mutable_classes",
    "description": "Avoid overloading operator == and hashCode on classes not marked `@immutable`.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#avoid-defining-custom-equality-for-mutable-classes):\n\n**AVOID** overloading operator == and hashCode on classes not marked `@immutable`.\n\nIf a class is not immutable, overloading `operator ==` and `hashCode` can\nlead to unpredictable and undesirable behavior when used in collections.\n\n**BAD:**\n```dart\nclass B {\n  String key;\n  const B(this.key);\n  @override\n  operator ==(other) => other is B && other.key == key;\n  @override\n  int get hashCode => key.hashCode;\n}\n```\n\n**GOOD:**\n```dart\n@immutable\nclass A {\n  final String key;\n  const A(this.key);\n  @override\n  operator ==(other) => other is A && other.key == key;\n  @override\n  int get hashCode => key.hashCode;\n}\n```\n\nNOTE: The lint checks the use of the `@immutable` annotation, and will trigger\neven if the class is otherwise not mutable. Thus:\n\n**BAD:**\n```dart\nclass C {\n  final String key;\n  const C(this.key);\n  @override\n  operator ==(other) => other is C && other.key == key;\n  @override\n  int get hashCode => key.hashCode;\n}\n```",
    "sinceDartSdk": "2.6"
  },
  {
    "name": "avoid_escaping_inner_quotes",
    "description": "Avoid escaping inner quotes by converting surrounding quotes.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Avoid escaping inner quotes by converting surrounding quotes.\n\n**BAD:**\n```dart\nvar s = 'It\\'s not fun';\n```\n\n**GOOD:**\n```dart\nvar s = \"It's not fun\";\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "avoid_field_initializers_in_const_classes",
    "description": "Avoid field initializers in const classes.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**AVOID** field initializers in const classes.\n\nInstead of `final x = const expr;`, you should write `get x => const expr;` and\nnot allocate a useless field. As of April 2018 this is true for the VM, but not\nfor code that will be compiled to JS.\n\n**BAD:**\n```dart\nclass A {\n  final a = const [];\n  const A();\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  get a => const [];\n  const A();\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_final_parameters",
    "description": "Avoid `final` for parameter declarations.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "prefer_final_parameters"
    ],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**AVOID** declaring parameters as `final`.\n\nDeclaring parameters as `final` can lead to unnecessarily verbose code,\nespecially when using the \"parameter_assignments\" rule.\n\n**BAD:**\n```dart\nvoid goodParameter(final String label) { // LINT\n  print(label);\n}\n```\n\n**GOOD:**\n```dart\nvoid badParameter(String label) { // OK\n  print(label);\n}\n```\n\n**BAD:**\n```dart\nvoid goodExpression(final int value) => print(value); // LINT\n```\n\n**GOOD:**\n```dart\nvoid badExpression(int value) => print(value); // OK\n```\n\n**BAD:**\n```dart\n[1, 4, 6, 8].forEach((final value) => print(value + 2)); // LINT\n```\n\n**GOOD:**\n```dart\n[1, 4, 6, 8].forEach((value) => print(value + 2)); // OK\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "avoid_function_literals_in_foreach_calls",
    "description": "Avoid using `forEach` with a function literal.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** using `forEach` with a function literal.\n\nThe `for` loop enables a developer to be clear and explicit as to their intent.\nA return in the body of the `for` loop returns from the body of the function,\nwhere as a return in the body of the `forEach` closure only returns a value\nfor that iteration of the `forEach`. The body of a `for` loop can contain\n`await`s, while the closure body of a `forEach` cannot.\n\n**BAD:**\n```dart\npeople.forEach((person) {\n  ...\n});\n```\n\n**GOOD:**\n```dart\nfor (var person in people) {\n  ...\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_futureor_void",
    "description": "Avoid using 'FutureOr<void>' as the type of a result.",
    "categories": [
      "errorProne",
      "unintentional"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**AVOID** using `FutureOr<void>` as the type of a result. This type is\nproblematic because it may appear to encode that a result is either a\n`Future<void>`, or the result should be discarded (when it is `void`).\nHowever, there is no safe way to detect whether we have one or the other\ncase (because an expression of type `void` can evaluate to any object\nwhatsoever, including a future of any type).\n\nIt is also conceptually unsound to have a type whose meaning is something\nlike \"ignore this object; also, take a look because it might be a future\".\n\nAn exception is made for contravariant occurrences of the type\n`FutureOr<void>` (e.g., for the type of a formal parameter), and no\nwarning is emitted for these occurrences. The reason for this exception\nis that the type does not describe a result, it describes a constraint\non a value provided by others. Similarly, an exception is made for type\nalias declarations, because they may well be used in a contravariant\nposition (e.g., as the type of a formal parameter). Hence, in type alias\ndeclarations, only the type parameter bounds are checked.\n\nA replacement for the type `FutureOr<void>` which is often useful is\n`Future<void>?`. This type encodes that the result is either a\n`Future<void>` or it is null, and there is no ambiguity at run time\nsince no object can have both types.\n\nIt may not always be possible to use the type `Future<void>?` as a\nreplacement for the type `FutureOr<void>`, because the latter is a\nsupertype of all types, and the former is not. In this case it may be a\nuseful remedy to replace `FutureOr<void>` by the type `void`.\n\n**BAD:**\n```dart\nFutureOr<void> m() {...}\n```\n\n**GOOD:**\n```dart\nFuture<void>? m() {...}\n```\n\n**This rule is experimental.** It is being evaluated, and it may be changed\nor removed. Feedback on its behavior is welcome! The main issue is here:\nhttps://github.com/dart-lang/linter/issues/4622",
    "sinceDartSdk": "3.6-wip"
  },
  {
    "name": "avoid_implementing_value_types",
    "description": "Don't implement classes that override `==`.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DON'T** implement classes that override `==`.\n\nThe `==` operator is contractually required to be an equivalence relation;\nthat is, symmetrically for all objects `o1` and `o2`, `o1 == o2` and `o2 == o1`\nmust either both be true, or both be false.\n\n> _NOTE_: Dart does not have true _value types_, so instead we consider a class\n> that implements `==`  as a _proxy_ for identifying value types.\n\nWhen using `implements`, you do not inherit the method body of `==`, making it\nnearly impossible to follow the contract of `==`. Classes that override `==`\ntypically are usable directly in tests _without_ creating mocks or fakes as\nwell. For example, for a given class `Size`:\n\n```dart\nclass Size {\n  final int inBytes;\n  const Size(this.inBytes);\n\n  @override\n  bool operator ==(Object other) => other is Size && other.inBytes == inBytes;\n\n  @override\n  int get hashCode => inBytes.hashCode;\n}\n```\n\n**BAD:**\n```dart\nclass CustomSize implements Size {\n  final int inBytes;\n  const CustomSize(this.inBytes);\n\n  int get inKilobytes => inBytes ~/ 1000;\n}\n```\n\n**BAD:**\n```dart\nimport 'package:test/test.dart';\nimport 'size.dart';\n\nclass FakeSize implements Size {\n  int inBytes = 0;\n}\n\nvoid main() {\n  test('should not throw on a size >1Kb', () {\n    expect(() => someFunction(FakeSize()..inBytes = 1001), returnsNormally);\n  });\n}\n```\n\n**GOOD:**\n```dart\nclass ExtendedSize extends Size {\n  ExtendedSize(int inBytes) : super(inBytes);\n\n  int get inKilobytes => inBytes ~/ 1000;\n}\n```\n\n**GOOD:**\n```dart\nimport 'package:test/test.dart';\nimport 'size.dart';\n\nvoid main() {\n  test('should not throw on a size >1Kb', () {\n    expect(() => someFunction(Size(1001)), returnsNormally);\n  });\n}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "avoid_init_to_null",
    "description": "Don't explicitly initialize variables to `null`.",
    "categories": [
      "brevity",
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#dont-explicitly-initialize-variables-to-null):\n\n**DON'T** explicitly initialize variables to `null`.\n\nIf a variable has a non-nullable type or is `final`,\nDart reports a compile error if you try to use it\nbefore it has been definitely initialized.\nIf the variable is nullable and not `const` or `final`,\nthen it is implicitly initialized to `null` for you.\nThere's no concept of \"uninitialized memory\" in Dart\nand no need to explicitly initialize a variable to `null` to be \"safe\".\nAdding `= null` is redundant and unneeded.\n\n**BAD:**\n```dart\nItem? bestDeal(List<Item> cart) {\n  Item? bestItem = null;\n\n  for (final item in cart) {\n    if (bestItem == null || item.price < bestItem.price) {\n      bestItem = item;\n    }\n  }\n\n  return bestItem;\n}\n```\n\n**GOOD:**\n```dart\nItem? bestDeal(List<Item> cart) {\n  Item? bestItem;\n\n  for (final item in cart) {\n    if (bestItem == null || item.price < bestItem.price) {\n      bestItem = item;\n    }\n  }\n\n  return bestItem;\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_js_rounded_ints",
    "description": "Avoid JavaScript rounded ints.",
    "categories": [
      "errorProne",
      "web"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**AVOID** integer literals that cannot be represented exactly when compiled to\nJavaScript.\n\nWhen a program is compiled to JavaScript `int` and `double` become JavaScript\nNumbers. Too large integers (`value < Number.MIN_SAFE_INTEGER` or\n`value > Number.MAX_SAFE_INTEGER`) may be rounded to the closest Number value.\n\nFor instance `1000000000000000001` cannot be represented exactly as a JavaScript\nNumber, so `1000000000000000000` will be used instead.\n\n**BAD:**\n```dart\nint value = 9007199254740995;\n```\n\n**GOOD:**\n```dart\nBigInt value = BigInt.parse('9007199254740995');\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_multiple_declarations_per_line",
    "description": "Don't declare multiple variables on a single line.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DON'T** declare multiple variables on a single line.\n\n**BAD:**\n```dart\nString? foo, bar, baz;\n```\n\n**GOOD:**\n```dart\nString? foo;\nString? bar;\nString? baz;\n```",
    "sinceDartSdk": "2.13"
  },
  {
    "name": "avoid_null_checks_in_equality_operators",
    "description": "Don't check for `null` in custom `==` operators.",
    "categories": [
      "style"
    ],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DON'T** check for `null` in custom `==` operators.\n\nAs `null` is a special value, no instance of any class (other than `Null`) can\nbe equivalent to it.  Thus, it is redundant to check whether the other instance\nis `null`.\n\n**BAD:**\n```dart\nclass Person {\n  final String? name;\n\n  @override\n  operator ==(Object? other) =>\n      other != null && other is Person && name == other.name;\n}\n```\n\n**GOOD:**\n```dart\nclass Person {\n  final String? name;\n\n  @override\n  operator ==(Object? other) => other is Person && name == other.name;\n}\n```\n\nThis rule has been removed.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_positional_boolean_parameters",
    "description": "Avoid positional boolean parameters.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#avoid-positional-boolean-parameters):\n\n**AVOID** positional boolean parameters.\n\nPositional boolean parameters are a bad practice because they are very\nambiguous.  Using named boolean parameters is much more readable because it\ninherently describes what the boolean value represents.\n\n**BAD:**\n```dart\nTask(true);\nTask(false);\nListBox(false, true, true);\nButton(false);\n```\n\n**GOOD:**\n```dart\nTask.oneShot();\nTask.repeating();\nListBox(scroll: true, showScrollbars: true);\nButton(ButtonState.enabled);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_print",
    "description": "Avoid `print` calls in production code.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** avoid `print` calls in production code.\n\nFor production code, consider using a logging framework.\nIf you are using Flutter, you can use `debugPrint`\nor surround `print` calls with a check for `kDebugMode`\n\n**BAD:**\n```dart\nvoid f(int x) {\n  print('debug: $x');\n  ...\n}\n```\n\n\n**GOOD:**\n```dart\nvoid f(int x) {\n  debugPrint('debug: $x');\n  ...\n}\n```\n\n\n**GOOD:**\n```dart\nvoid f(int x) {\n  log('log: $x');\n  ...\n}\n```\n\n\n**GOOD:**\n```dart\nvoid f(int x) {\n  if (kDebugMode) {\n      print('debug: $x');\n  }\n  ...\n}\n```",
    "sinceDartSdk": "2.5"
  },
  {
    "name": "avoid_private_typedef_functions",
    "description": "Avoid private typedef functions.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**AVOID** private typedef functions used only once. Prefer inline function\nsyntax.\n\n**BAD:**\n```dart\ntypedef void _F();\nm(_F f);\n```\n\n**GOOD:**\n```dart\nm(void Function() f);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_redundant_argument_values",
    "description": "Avoid redundant argument values.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DON'T** pass an argument that matches the corresponding parameter's default\nvalue.\n\nNote that a method override can change the default value of a parameter, so that\nan argument may be equal to one default value, and not the other. Take, for\nexample, two classes, `A` and `B` where `B` is a subclass of `A`, and `B`\noverrides a method declared on `A`, and that method has a parameter with one\ndefault value in `A`'s declaration, and a different default value in `B`'s\ndeclaration. If the static type of the target of the invoked method is `B`, and\n`B`'s default value matches the argument, then the argument can be omitted (and\nif the argument value is different, then a lint is not reported). If, however,\nthe static type of the target of the invoked method is `A`, then a lint may be\nreported, but we cannot know statically which method is invoked, so the reported\nlint may be a false positive. Such cases can be ignored inline with a comment\nlike `// ignore: avoid_redundant_argument_values`.\n\n**BAD:**\n```dart\nvoid f({bool valWithDefault = true, bool? val}) {\n  ...\n}\n\nvoid main() {\n  f(valWithDefault: true);\n}\n```\n\n**GOOD:**\n```dart\nvoid f({bool valWithDefault = true, bool? val}) {\n  ...\n}\n\nvoid main() {\n  f(valWithDefault: false);\n  f();\n}\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "avoid_relative_lib_imports",
    "description": "Avoid relative imports for files in `lib/`.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** avoid relative imports for files in `lib/`.\n\nWhen mixing relative and absolute imports it's possible to create confusion\nwhere the same member gets imported in two different ways.  An easy way to avoid\nthat is to ensure you have no relative imports that include `lib/` in their\npaths.\n\nYou can also use 'always_use_package_imports' to disallow relative imports\nbetween files within `lib/`.\n\n**BAD:**\n```dart\nimport 'package:foo/bar.dart';\n\nimport '../lib/baz.dart';\n\n...\n```\n\n**GOOD:**\n```dart\nimport 'package:foo/bar.dart';\n\nimport 'baz.dart';\n\n...\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_renaming_method_parameters",
    "description": "Don't rename parameters of overridden methods.",
    "categories": [
      "documentationCommentMaintenance"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** rename parameters of overridden methods.\n\nMethods that override another method, but do not have their own documentation\ncomment, will inherit the overridden method's comment when `dart doc` produces\ndocumentation. If the inherited method contains the name of the parameter (in\nsquare brackets), then `dart doc` cannot link it correctly.\n\n**BAD:**\n```dart\nabstract class A {\n  m(a);\n}\n\nabstract class B extends A {\n  m(b);\n}\n```\n\n**GOOD:**\n```dart\nabstract class A {\n  m(a);\n}\n\nabstract class B extends A {\n  m(a);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_return_types_on_setters",
    "description": "Avoid return types on setters.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** return types on setters.\n\nAs setters do not return a value, declaring the return type of one is redundant.\n\n**BAD:**\n```dart\nvoid set speed(int ms);\n```\n\n**GOOD:**\n```dart\nset speed(int ms);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_returning_null",
    "description": "Avoid returning null from members whose return type is bool, double, int, or num.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.3.0; it is no longer functional.\n\n**AVOID** returning null from members whose return type is bool, double, int,\nor num.\n\nFunctions that return primitive types such as bool, double, int, and num are\ngenerally expected to return non-nullable values.  Thus, returning null where a\nprimitive type was expected can lead to runtime exceptions.\n\n**BAD:**\n```dart\nbool getBool() => null;\nnum getNum() => null;\nint getInt() => null;\ndouble getDouble() => null;\n```\n\n**GOOD:**\n```dart\nbool getBool() => false;\nnum getNum() => -1;\nint getInt() => -1;\ndouble getDouble() => -1.0;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_returning_null_for_future",
    "description": "Avoid returning null for Future.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.3.0; it is no longer functional.\n\n**AVOID** returning null for Future.\n\nIt is almost always wrong to return `null` for a `Future`.  Most of the time the\ndeveloper simply forgot to put an `async` keyword on the function.",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "avoid_returning_null_for_void",
    "description": "Avoid returning `null` for `void`.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** returning `null` for `void`.\n\nIn a large variety of languages `void` as return type is used to indicate that\na function doesn't return anything. Dart allows returning `null` in functions\nwith `void` return type but it also allow using `return;` without specifying any\nvalue. To have a consistent way you should not return `null` and only use an\nempty return.\n\n**BAD:**\n```dart\nvoid f1() {\n  return null;\n}\nFuture<void> f2() async {\n  return null;\n}\n```\n\n**GOOD:**\n```dart\nvoid f1() {\n  return;\n}\nFuture<void> f2() async {\n  return;\n}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "avoid_returning_this",
    "description": "Avoid returning this from methods just to enable a fluent interface.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#avoid-returning-this-from-methods-just-to-enable-a-fluent-interface):\n\n**AVOID** returning this from methods just to enable a fluent interface.\n\nReturning `this` from a method is redundant; Dart has a cascade operator which\nallows method chaining universally.\n\nReturning `this` is allowed for:\n\n- operators\n- methods with a return type different of the current class\n- methods defined in parent classes / mixins or interfaces\n- methods defined in extensions\n\n**BAD:**\n```dart\nvar buffer = StringBuffer()\n  .write('one')\n  .write('two')\n  .write('three');\n```\n\n**GOOD:**\n```dart\nvar buffer = StringBuffer()\n  ..write('one')\n  ..write('two')\n  ..write('three');\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_setters_without_getters",
    "description": "Avoid setters without getters.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DON'T** define a setter without a corresponding getter.\n\nDefining a setter without defining a corresponding getter can lead to logical\ninconsistencies.  Doing this could allow you to set a property to some value,\nbut then upon observing the property's value, it could easily be different.\n\n**BAD:**\n```dart\nclass Bad {\n  int l, r;\n\n  set length(int newLength) {\n    r = l + newLength;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Good {\n  int l, r;\n\n  int get length => r - l;\n\n  set length(int newLength) {\n    r = l + newLength;\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_shadowing_type_parameters",
    "description": "Avoid shadowing type parameters.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**AVOID** shadowing type parameters.\n\n**BAD:**\n```dart\nclass A<T> {\n  void fn<T>() {}\n}\n```\n\n**GOOD:**\n```dart\nclass A<T> {\n  void fn<U>() {}\n}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "avoid_single_cascade_in_expression_statements",
    "description": "Avoid single cascade in expression statements.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** single cascade in expression statements.\n\n**BAD:**\n```dart\no..m();\n```\n\n**GOOD:**\n```dart\no.m();\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_slow_async_io",
    "description": "Avoid slow asynchronous `dart:io` methods.",
    "categories": [
      "nonPerformant"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**AVOID** using the following asynchronous file I/O methods because they are\nmuch slower than their synchronous counterparts.\n\n* `Directory.exists`\n* `Directory.stat`\n* `File.lastModified`\n* `File.exists`\n* `File.stat`\n* `FileSystemEntity.isDirectory`\n* `FileSystemEntity.isFile`\n* `FileSystemEntity.isLink`\n* `FileSystemEntity.type`\n\n**BAD:**\n```dart\nimport 'dart:io';\n\nFuture<Null> someFunction() async {\n  var file = File('/path/to/my/file');\n  var now = DateTime.now();\n  if ((await file.lastModified()).isBefore(now)) print('before'); // LINT\n}\n```\n\n**GOOD:**\n```dart\nimport 'dart:io';\n\nFuture<Null> someFunction() async {\n  var file = File('/path/to/my/file');\n  var now = DateTime.now();\n  if (file.lastModifiedSync().isBefore(now)) print('before'); // OK\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_type_to_string",
    "description": "Avoid <Type>.toString() in production code since results may be minified.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** avoid calls to <Type>.toString() in production code, since it does not\ncontractually return the user-defined name of the Type (or underlying class).\nDevelopment-mode compilers where code size is not a concern use the full name,\nbut release-mode compilers often choose to minify these symbols.\n\n**BAD:**\n```dart\nvoid bar(Object other) {\n  if (other.runtimeType.toString() == 'Bar') {\n    doThing();\n  }\n}\n\nObject baz(Thing myThing) {\n  return getThingFromDatabase(key: myThing.runtimeType.toString());\n}\n```\n\n**GOOD:**\n```dart\nvoid bar(Object other) {\n  if (other is Bar) {\n    doThing();\n  }\n}\n\nclass Thing {\n  String get thingTypeKey => ...\n}\n\nObject baz(Thing myThing) {\n  return getThingFromDatabase(key: myThing.thingTypeKey);\n}\n```",
    "sinceDartSdk": "2.12"
  },
  {
    "name": "avoid_types_as_parameter_names",
    "description": "Avoid types as parameter names.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** using a parameter name that is the same as an existing type.\n\n**BAD:**\n```dart\nm(f(int));\n```\n\n**GOOD:**\n```dart\nm(f(int v));\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_types_on_closure_parameters",
    "description": "Avoid annotating types for function expression parameters.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "always_specify_types"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**AVOID** annotating types for function expression parameters.\n\nAnnotating types for function expression parameters is usually unnecessary\nbecause the parameter types can almost always be inferred from the context,\nthus making the practice redundant.\n\n**BAD:**\n```dart\nvar names = people.map((Person person) => person.name);\n```\n\n**GOOD:**\n```dart\nvar names = people.map((person) => person.name);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_unnecessary_containers",
    "description": "Avoid unnecessary containers.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** wrapping widgets in unnecessary containers.\n\nWrapping a widget in `Container` with no other parameters set has no effect\nand makes code needlessly more complex.\n\n**BAD:**\n```dart\nWidget buildRow() {\n  return Container(\n      child: Row(\n        children: <Widget>[\n          const MyLogo(),\n          const Expanded(\n            child: Text('...'),\n          ),\n        ],\n      )\n  );\n}\n```\n\n**GOOD:**\n```dart\nWidget buildRow() {\n  return Row(\n    children: <Widget>[\n      const MyLogo(),\n      const Expanded(\n        child: Text('...'),\n      ),\n    ],\n  );\n}\n```",
    "sinceDartSdk": "2.7"
  },
  {
    "name": "avoid_unstable_final_fields",
    "description": "Avoid overriding a final field to return different values if called multiple times.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "This rule has been removed.",
    "sinceDartSdk": "3.3"
  },
  {
    "name": "avoid_unused_constructor_parameters",
    "description": "Avoid defining unused parameters in constructors.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**AVOID** defining unused parameters in constructors.\n\n**BAD:**\n```dart\nclass BadOne {\n  BadOne(int unusedParameter, [String unusedPositional]);\n}\n\nclass BadTwo {\n  int c;\n\n  BadTwo(int a, int b, int x) {\n    c = a + b;\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "avoid_void_async",
    "description": "Avoid `async` functions that return `void`.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** mark `async` functions as returning `Future<void>`.\n\nWhen declaring an `async` method or function which does not return a value,\ndeclare that it returns `Future<void>` and not just `void`.\n\n**BAD:**\n```dart\nvoid f() async {}\nvoid f2() async => null;\n```\n\n**GOOD:**\n```dart\nFuture<void> f() async {}\nFuture<void> f2() async => null;\n```\n\n**EXCEPTION:**\n\nAn exception is made for top-level `main` functions, where the `Future`\nannotation *can* (and generally should) be dropped in favor of `void`.\n\n**GOOD:**\n```dart\nFuture<void> f() async {}\n\nvoid main() async {\n  await f();\n}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "avoid_web_libraries_in_flutter",
    "description": "Avoid using web-only libraries outside Flutter web plugin packages.",
    "categories": [
      "errorProne",
      "flutter",
      "web"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**AVOID** using web libraries, `dart:html`, `dart:js` and\n`dart:js_util` in Flutter packages that are not web plugins. These libraries are\nnot supported outside of a web context; functionality that depends on them will\nfail at runtime in Flutter mobile, and their use is generally discouraged in\nFlutter web.\n\nWeb library access *is* allowed in:\n\n* plugin packages that declare `web` as a supported context\n\notherwise, imports of `dart:html`, `dart:js` and  `dart:js_util` are disallowed.",
    "sinceDartSdk": "2.6"
  },
  {
    "name": "await_only_futures",
    "description": "Await only futures.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** using await on anything which is not a future.\n\nAwait is allowed on the types: `Future<X>`, `FutureOr<X>`, `Future<X>?`,\n`FutureOr<X>?` and `dynamic`.\n\nFurther, using `await null` is specifically allowed as a way to introduce a\nmicrotask delay.\n\n**BAD:**\n```dart\nmain() async {\n  print(await 23);\n}\n```\n\n**GOOD:**\n```dart\nmain() async {\n  await null; // If a delay is really intended.\n  print(23);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "camel_case_extensions",
    "description": "Name extensions using UpperCamelCase.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/style#do-name-extensions-using-uppercamelcase):\n\n**DO** name extensions using `UpperCamelCase`.\n\nExtensions should capitalize the first letter of each word (including\nthe first word), and use no separators.\n\n**GOOD:**\n```dart\nextension MyFancyList<T> on List<T> {\n  // ...\n}\n\nextension SmartIterable<T> on Iterable<T> {\n  // ...\n}\n```",
    "sinceDartSdk": "2.6"
  },
  {
    "name": "camel_case_types",
    "description": "Name types using UpperCamelCase.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/style#do-name-types-using-uppercamelcase):\n\n**DO** name types using UpperCamelCase.\n\nClasses and typedefs should capitalize the first letter of each word (including\nthe first word), and use no separators.\n\n**GOOD:**\n```dart\nclass SliderMenu {\n  // ...\n}\n\nclass HttpRequest {\n  // ...\n}\n\ntypedef num Adder(num x, num y);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "cancel_subscriptions",
    "description": "Cancel instances of `dart:async` `StreamSubscription`.",
    "categories": [
      "errorProne",
      "memoryLeaks"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** invoke `cancel` on instances of `dart:async` `StreamSubscription`.\n\nCancelling instances of StreamSubscription prevents memory leaks and unexpected\nbehavior.\n\n**BAD:**\n```dart\nclass A {\n  StreamSubscription _subscriptionA; // LINT\n  void init(Stream stream) {\n    _subscriptionA = stream.listen((_) {});\n  }\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction() {\n  StreamSubscription _subscriptionF; // LINT\n}\n```\n\n**GOOD:**\n```dart\nclass B {\n  StreamSubscription _subscriptionB; // OK\n  void init(Stream stream) {\n    _subscriptionB = stream.listen((_) {});\n  }\n\n  void dispose(filename) {\n    _subscriptionB.cancel();\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunctionOK() {\n  StreamSubscription _subscriptionB; // OK\n  _subscriptionB.cancel();\n}\n```\n\n**Known limitations**\n\nThis rule does not track all patterns of StreamSubscription instantiations and\ncancellations. See [linter#317](https://github.com/dart-lang/linter/issues/317)\nfor more information.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "cascade_invocations",
    "description": "Cascade consecutive method invocations on the same reference.",
    "categories": [
      "brevity",
      "languageFeatureUsage",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** Use the cascading style when successively invoking methods on the same\nreference.\n\n**BAD:**\n```dart\nSomeClass someReference = SomeClass();\nsomeReference.firstMethod();\nsomeReference.secondMethod();\n```\n\n**BAD:**\n```dart\nSomeClass someReference = SomeClass();\n...\nsomeReference.firstMethod();\nsomeReference.aProperty = value;\nsomeReference.secondMethod();\n```\n\n**GOOD:**\n```dart\nSomeClass someReference = SomeClass()\n    ..firstMethod()\n    ..aProperty = value\n    ..secondMethod();\n```\n\n**GOOD:**\n```dart\nSomeClass someReference = SomeClass();\n...\nsomeReference\n    ..firstMethod()\n    ..aProperty = value\n    ..secondMethod();\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "cast_nullable_to_non_nullable",
    "description": "Don't cast a nullable value to a non nullable type.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DON'T** cast a nullable value to a non nullable type. This hides a null check\nand most of the time it is not what is expected.\n\n**BAD:**\n```dart\nclass A {}\nclass B extends A {}\n\nA? a;\nvar v = a as B;\nvar v = a as A;\n```\n\n**GOOD:**\n```dart\nclass A {}\nclass B extends A {}\n\nA? a;\nvar v = a! as B;\nvar v = a!;\n```",
    "sinceDartSdk": "2.12"
  },
  {
    "name": "close_sinks",
    "description": "Close instances of `dart:core` `Sink`.",
    "categories": [
      "errorProne",
      "memoryLeaks"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** invoke `close` on instances of `dart:core` `Sink`.\n\nClosing instances of Sink prevents memory leaks and unexpected behavior.\n\n**BAD:**\n```dart\nclass A {\n  IOSink _sinkA;\n  void init(filename) {\n    _sinkA = File(filename).openWrite(); // LINT\n  }\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction() {\n  IOSink _sinkF; // LINT\n}\n```\n\n**GOOD:**\n```dart\nclass B {\n  IOSink _sinkB;\n  void init(filename) {\n    _sinkB = File(filename).openWrite(); // OK\n  }\n\n  void dispose(filename) {\n    _sinkB.close();\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunctionOK() {\n  IOSink _sinkFOK; // OK\n  _sinkFOK.close();\n}\n```\n\n**Known limitations**\n\nThis rule does not track all patterns of Sink instantiations and\nclosures. See [linter#1381](https://github.com/dart-lang/linter/issues/1381)\nfor more information.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "collection_methods_unrelated_type",
    "description": "Invocation of various collection methods with arguments of unrelated types.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DON'T** invoke certain collection method with an argument with an unrelated\ntype.\n\nDoing this will invoke `==` on the collection's elements and most likely will\nreturn `false`.\n\nAn argument passed to a collection method should relate to the collection type\nas follows:\n\n* an argument to `Iterable<E>.contains` should be related to `E`\n* an argument to `List<E>.remove` should be related to `E`\n* an argument to `Map<K, V>.containsKey` should be related to `K`\n* an argument to `Map<K, V>.containsValue` should be related to `V`\n* an argument to `Map<K, V>.remove` should be related to `K`\n* an argument to `Map<K, V>.[]` should be related to `K`\n* an argument to `Queue<E>.remove` should be related to `E`\n* an argument to `Set<E>.lookup` should be related to `E`\n* an argument to `Set<E>.remove` should be related to `E`\n\n**BAD:**\n```dart\nvoid someFunction() {\n  var list = <int>[];\n  if (list.contains('1')) print('someFunction'); // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction() {\n  var set = <int>{};\n  set.remove('1'); // LINT\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction() {\n  var list = <int>[];\n  if (list.contains(1)) print('someFunction'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction() {\n  var set = <int>{};\n  set.remove(1); // OK\n}\n```",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "combinators_ordering",
    "description": "Sort combinator names alphabetically.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** sort combinator names alphabetically.\n\n**BAD:**\n```dart\nimport 'a.dart' show B, A hide D, C;\nexport 'a.dart' show B, A hide D, C;\n```\n\n**GOOD:**\n```dart\nimport 'a.dart' show A, B hide C, D;\nexport 'a.dart' show A, B hide C, D;\n```",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "comment_references",
    "description": "Only reference in-scope identifiers in doc comments.",
    "categories": [
      "documentationCommentMaintenance"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** reference only in-scope identifiers in doc comments.\n\nIf you surround identifiers like variable, method, or type names in square\nbrackets, then tools like your IDE and\n[`dart doc`](https://dart.dev/tools/dart-doc) can link to them. For this to\nwork, ensure that all identifiers in docs wrapped in brackets are in scope.\n\nFor example, assuming `outOfScopeId` is out of scope:\n\n**BAD:**\n```dart\n/// Returns whether [value] is larger than [outOfScopeId].\nbool isOutOfRange(int value) { ... }\n```\n\n**GOOD:**\n```dart\n/// Returns the larger of [a] or [b].\nint max_int(int a, int b) { ... }\n```\n\nNote that the square bracket comment format is designed to allow comments to\nrefer to declarations using a fairly natural format but does not allow\n*arbitrary expressions*.  In particular, code references within square brackets\ncan consist of any of the following:\n\n- A bare identifier which is in-scope for the comment (see the spec for what is\n  \"in-scope\" in doc comments). Examples include `[print]` and `[Future]`.\n- Two identifiers separated by a period (a \"prefixed identifier\"), such that the\n  first identifier acts as a namespacing identifier, such as a class property\n  name or method name prefixed by the containing class's name, or a top-level\n  identifier prefixed by an import prefix. Examples include `[Future.new]` (an\n  unnamed constructor), `[Future.value]` (a constructor), `[Future.wait]` (a\n  static method), `[Future.then]` (an instance method), `[math.max]` (given that\n  'dart:async' is imported with a `max` prefix).\n- A prefixed identifier followed by a pair of parentheses, used to disambiguate\n  named constructors from instance members (whose names are allowed to collide).\n  Examples include `[Future.value()]`.\n- Three identifiers separated by two periods, such that the first identifier is\n  an import prefix name, the second identifier is a top-level element like a\n  class or an extension, and the third identifier is a member of that top-level\n  element. Examples include `[async.Future.then]` (given that 'dart:async' is\n  imported with an `async` prefix).\n\n**Known limitations**\n\nThe `comment_references` lint rule aligns with the Dart analyzer's notion of\ncomment references, which is occasionally distinct from Dartdoc's notion of\ncomment references. The lint rule may report comment references which Dartdoc\ncan resolve, even though the analyzer cannot. See\n[linter#1142](https://github.com/dart-lang/linter/issues/1142) for more\ninformation.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "conditional_uri_does_not_exist",
    "description": "Missing conditional import.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DON'T** reference files that do not exist in conditional imports.\n\nCode may fail at runtime if the condition evaluates such that the missing file\nneeds to be imported.\n\n**BAD:**\n```dart\nimport 'file_that_does_exist.dart'\n  if (condition) 'file_that_does_not_exist.dart';\n```\n\n**GOOD:**\n```dart\nimport 'file_that_does_exist.dart'\n  if (condition) 'file_that_also_does_exist.dart';\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "constant_identifier_names",
    "description": "Prefer using lowerCamelCase for constant names.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** using lowerCamelCase for constant names.\n\nIn new code, use `lowerCamelCase` for constant variables, including enum values.\n\nIn existing code that uses `ALL_CAPS_WITH_UNDERSCORES` for constants, you may\ncontinue to use all caps to stay consistent.\n\n**BAD:**\n```dart\nconst PI = 3.14;\nconst kDefaultTimeout = 1000;\nfinal URL_SCHEME = RegExp('^([a-z]+):');\n\nclass Dice {\n  static final NUMBER_GENERATOR = Random();\n}\n```\n\n**GOOD:**\n```dart\nconst pi = 3.14;\nconst defaultTimeout = 1000;\nfinal urlScheme = RegExp('^([a-z]+):');\n\nclass Dice {\n  static final numberGenerator = Random();\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "control_flow_in_finally",
    "description": "Avoid control flow in `finally` blocks.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**AVOID** control flow leaving `finally` blocks.\n\nUsing control flow in `finally` blocks will inevitably cause unexpected behavior\nthat is hard to debug.\n\n**BAD:**\n```dart\nclass BadReturn {\n  double nonCompliantMethod() {\n    try {\n      return 1 / 0;\n    } catch (e) {\n      print(e);\n    } finally {\n      return 1.0; // LINT\n    }\n  }\n}\n```\n\n**BAD:**\n```dart\nclass BadContinue {\n  double nonCompliantMethod() {\n    for (var o in [1, 2]) {\n      try {\n        print(o / 0);\n      } catch (e) {\n        print(e);\n      } finally {\n        continue; // LINT\n      }\n    }\n    return 1.0;\n  }\n}\n```\n\n**BAD:**\n```dart\nclass BadBreak {\n  double nonCompliantMethod() {\n    for (var o in [1, 2]) {\n      try {\n        print(o / 0);\n      } catch (e) {\n        print(e);\n      } finally {\n        break; // LINT\n      }\n    }\n    return 1.0;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Ok {\n  double compliantMethod() {\n    var i = 5;\n    try {\n      i = 1 / 0;\n    } catch (e) {\n      print(e); // OK\n    }\n    return i;\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "curly_braces_in_flow_control_structures",
    "description": "DO use curly braces for all flow control structures.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** use curly braces for all flow control structures.\n\nDoing so avoids the [dangling else](https://en.wikipedia.org/wiki/Dangling_else)\nproblem.\n\n**BAD:**\n```dart\nif (overflowChars != other.overflowChars)\n  return overflowChars < other.overflowChars;\n```\n\n**GOOD:**\n```dart\nif (isWeekDay) {\n  print('Bike to work!');\n} else {\n  print('Go dancing or read a book!');\n}\n```\n\nThere is one exception to this: an `if` statement with no `else` clause where\nthe entire `if` statement (including the condition and the body) fits in one\nline. In that case, you may leave off the braces if you prefer:\n\n**GOOD:**\n```dart\nif (arg == null) return defaultValue;\n```\n\nIf the body wraps to the next line, though, use braces:\n\n**GOOD:**\n```dart\nif (overflowChars != other.overflowChars) {\n  return overflowChars < other.overflowChars;\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "dangling_library_doc_comments",
    "description": "Attach library doc comments to library directives.",
    "categories": [
      "documentationCommentMaintenance"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Attach library doc comments (with `///`) to library directives, rather than\nleaving them dangling near the top of a library.\n\n**BAD:**\n```dart\n/// This is a great library.\nimport 'package:math';\n```\n\n```dart\n/// This is a great library.\n\nclass C {}\n```\n\n**GOOD:**\n```dart\n/// This is a great library.\nlibrary;\n\nimport 'package:math';\n\nclass C {}\n```\n\n**NOTE:** An unnamed library, like `library;` above, is only supported in Dart\n2.19 and later. Code which might run in earlier versions of Dart will need to\nprovide a name in the `library` directive.",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "depend_on_referenced_packages",
    "description": "Depend on referenced packages.",
    "categories": [
      "pub"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "needsFix",
    "details": "**DO** depend on referenced packages.\n\nWhen importing a package, add a dependency on it to your pubspec.\n\nDepending explicitly on packages that you reference ensures they will always\nexist and allows you to put a dependency constraint on them to guard you\nagainst breaking changes.\n\nWhether this should be a regular dependency or dev_dependency depends on if it\nis referenced from a public file (one under either `lib` or `bin`), or some\nother private file.\n\n**BAD:**\n```dart\nimport 'package:a/a.dart';\n```\n\n```yaml\ndependencies:\n```\n\n**GOOD:**\n```dart\nimport 'package:a/a.dart';\n```\n\n```yaml\ndependencies:\n  a: ^1.0.0\n```",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "deprecated_consistency",
    "description": "Missing deprecated annotation.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** apply `@Deprecated()` consistently:\n\n- if a class is deprecated, its constructors should also be deprecated.\n- if a field is deprecated, the constructor parameter pointing to it should also\n  be deprecated.\n- if a constructor parameter pointing to a field is deprecated, the field should\n  also be deprecated.\n\n**BAD:**\n```dart\n@deprecated\nclass A {\n  A();\n}\n\nclass B {\n  B({this.field});\n  @deprecated\n  Object field;\n}\n```\n\n**GOOD:**\n```dart\n@deprecated\nclass A {\n  @deprecated\n  A();\n}\n\nclass B {\n  B({@deprecated this.field});\n  @deprecated\n  Object field;\n}\n\nclass C extends B {\n  C({@deprecated super.field});\n}\n```",
    "sinceDartSdk": "2.13"
  },
  {
    "name": "deprecated_member_use_from_same_package",
    "description": "Avoid using deprecated elements from within the package in which they are declared.",
    "categories": [
      "languageFeatureUsage"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Elements that are annotated with `@Deprecated` should not be referenced from\nwithin the package in which they are declared.\n\n**AVOID** using deprecated elements.\n\n...\n\n**BAD:**\n```dart\n// Declared in one library:\nclass Foo {\n  @Deprecated(\"Use 'm2' instead\")\n  void m1() {}\n\n  void m2({\n      @Deprecated('This is an old parameter') int? p,\n  })\n}\n\n@Deprecated('Do not use')\nint x = 0;\n\n// In the same or another library, but within the same package:\nvoid m(Foo foo) {\n  foo.m1();\n  foo.m2(p: 7);\n  x = 1;\n}\n```\n\nDeprecated elements can be used from within _other_ deprecated elements, in\norder to allow for the deprecation of a collection of APIs together as one unit.\n\n**GOOD:**\n```dart\n// Declared in one library:\nclass Foo {\n  @Deprecated(\"Use 'm2' instead\")\n  void m1() {}\n\n  void m2({\n      @Deprecated('This is an old parameter') int? p,\n  })\n}\n\n@Deprecated('Do not use')\nint x = 0;\n\n// In the same or another library, but within the same package:\n@Deprecated('Do not use')\nvoid m(Foo foo) {\n  foo.m1();\n  foo.m2(p: 7);\n  x = 1;\n}\n```",
    "sinceDartSdk": "3.0"
  },
  {
    "name": "diagnostic_describe_all_properties",
    "description": "DO reference all public properties in debug methods.",
    "categories": [
      "errorProne",
      "flutter"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** reference all public properties in `debug` method implementations.\n\nImplementers of `Diagnosticable` should reference all public properties in\na `debugFillProperties(...)` or `debugDescribeChildren(...)` method\nimplementation to improve debuggability at runtime.\n\nPublic properties are defined as fields and getters that are\n\n* not package-private (e.g., prefixed with `_`)\n* not `static` or overriding\n* not themselves `Widget`s or collections of `Widget`s\n\nIn addition, the \"debug\" prefix is treated specially for properties in Flutter.\nFor the purposes of diagnostics, a property `foo` and a prefixed property\n`debugFoo` are treated as effectively describing the same property and it is\nsufficient to refer to one or the other.\n\n**BAD:**\n```dart\nclass Absorber extends Widget {\n  bool get absorbing => _absorbing;\n  bool _absorbing;\n  bool get ignoringSemantics => _ignoringSemantics;\n  bool _ignoringSemantics;\n  @override\n  void debugFillProperties(DiagnosticPropertiesBuilder properties) {\n    super.debugFillProperties(properties);\n    properties.add(DiagnosticsProperty<bool>('absorbing', absorbing));\n    // Missing reference to ignoringSemantics\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Absorber extends Widget {\n  bool get absorbing => _absorbing;\n  bool _absorbing;\n  bool get ignoringSemantics => _ignoringSemantics;\n  bool _ignoringSemantics;\n  @override\n  void debugFillProperties(DiagnosticPropertiesBuilder properties) {\n    super.debugFillProperties(properties);\n    properties.add(DiagnosticsProperty<bool>('absorbing', absorbing));\n    properties.add(DiagnosticsProperty<bool>('ignoringSemantics', ignoringSemantics));\n  }\n}\n```",
    "sinceDartSdk": "2.3"
  },
  {
    "name": "directives_ordering",
    "description": "Adhere to Effective Dart Guide directives sorting conventions.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** follow the directive ordering conventions in\n[Effective Dart](https://dart.dev/effective-dart/style#ordering):\n\n**DO** place `dart:` imports before other imports.\n\n**BAD:**\n```dart\nimport 'package:bar/bar.dart';\nimport 'package:foo/foo.dart';\n\nimport 'dart:async';  // LINT\nimport 'dart:html';  // LINT\n```\n\n**BAD:**\n```dart\nimport 'dart:html';  // OK\nimport 'package:bar/bar.dart';\n\nimport 'dart:async';  // LINT\nimport 'package:foo/foo.dart';\n```\n\n**GOOD:**\n```dart\nimport 'dart:async';  // OK\nimport 'dart:html';  // OK\n\nimport 'package:bar/bar.dart';\nimport 'package:foo/foo.dart';\n```\n\n**DO** place `package:` imports before relative imports.\n\n**BAD:**\n```dart\nimport 'a.dart';\nimport 'b.dart';\n\nimport 'package:bar/bar.dart';  // LINT\nimport 'package:foo/foo.dart';  // LINT\n```\n\n**BAD:**\n```dart\nimport 'package:bar/bar.dart';  // OK\nimport 'a.dart';\n\nimport 'package:foo/foo.dart';  // LINT\nimport 'b.dart';\n```\n\n**GOOD:**\n```dart\nimport 'package:bar/bar.dart';  // OK\nimport 'package:foo/foo.dart';  // OK\n\nimport 'a.dart';\nimport 'b.dart';\n```\n\n**DO** specify exports in a separate section after all imports.\n\n**BAD:**\n```dart\nimport 'src/error.dart';\nexport 'src/error.dart'; // LINT\nimport 'src/string_source.dart';\n```\n\n**GOOD:**\n```dart\nimport 'src/error.dart';\nimport 'src/string_source.dart';\n\nexport 'src/error.dart'; // OK\n```\n\n**DO** sort sections alphabetically.\n\n**BAD:**\n```dart\nimport 'package:foo/bar.dart'; // OK\nimport 'package:bar/bar.dart'; // LINT\n\nimport 'a/b.dart'; // OK\nimport 'a.dart'; // LINT\n```\n\n**GOOD:**\n```dart\nimport 'package:bar/bar.dart'; // OK\nimport 'package:foo/bar.dart'; // OK\n\nimport 'a.dart'; // OK\nimport 'a/b.dart'; // OK\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "discarded_futures",
    "description": "Don't invoke asynchronous functions in non-`async` blocks.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Making asynchronous calls in non-`async` functions is usually the sign of a\nprogramming error.  In general these functions should be marked `async` and such\nfutures should likely be awaited (as enforced by `unawaited_futures`).\n\n**DON'T** invoke asynchronous functions in non-`async` blocks.\n\n**BAD:**\n```dart\nvoid recreateDir(String path) {\n  deleteDir(path);\n  createDir(path);\n}\n\nFuture<void> deleteDir(String path) async {}\n\nFuture<void> createDir(String path) async {}\n```\n\n**GOOD:**\n```dart\nFuture<void> recreateDir(String path) async {\n  await deleteDir(path);\n  await createDir(path);\n}\n\nFuture<void> deleteDir(String path) async {}\n\nFuture<void> createDir(String path) async {}\n```",
    "sinceDartSdk": "2.18"
  },
  {
    "name": "do_not_use_environment",
    "description": "Do not use environment declared variables.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "Using values derived from the environment at compile-time, creates\nhidden global state and makes applications hard to understand and maintain.\n\n**DON'T** use `fromEnvironment` or `hasEnvironment` factory constructors.\n\n**BAD:**\n```dart\nconst loggingLevel =\n  bool.hasEnvironment('logging') ? String.fromEnvironment('logging') : null;\n```",
    "sinceDartSdk": "2.9"
  },
  {
    "name": "document_ignores",
    "description": "Document ignore comments.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** document all ignored diagnostic reports.\n\n**BAD:**\n```dart\n// ignore: unused_element\nint _x = 1;\n```\n\n**GOOD:**\n```dart\n// This private field will be used later.\n// ignore: unused_element\nint _x = 1;\n```",
    "sinceDartSdk": "3.5"
  },
  {
    "name": "empty_catches",
    "description": "Avoid empty catch blocks.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** empty catch blocks.\n\nIn general, empty catch blocks should be avoided.  In cases where they are\nintended, a comment should be provided to explain why exceptions are being\ncaught and suppressed.  Alternatively, the exception identifier can be named with\nunderscores (e.g., `_`) to indicate that we intend to skip it.\n\n**BAD:**\n```dart\ntry {\n  ...\n} catch(exception) { }\n```\n\n**GOOD:**\n```dart\ntry {\n  ...\n} catch(e) {\n  // ignored, really.\n}\n\n// Alternatively:\ntry {\n  ...\n} catch(_) { }\n\n// Better still:\ntry {\n  ...\n} catch(e) {\n  doSomething(e);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "empty_constructor_bodies",
    "description": "Use `;` instead of `{}` for empty constructor bodies.",
    "categories": [
      "brevity",
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#do-use--instead-of--for-empty-constructor-bodies):\n\n**DO** use `;` instead of `{}` for empty constructor bodies.\n\nIn Dart, a constructor with an empty body can be terminated with just a\nsemicolon.  This is required for const constructors.  For consistency and\nbrevity, other constructors should also do this.\n\n**BAD:**\n```dart\nclass Point {\n  int x, y;\n  Point(this.x, this.y) {}\n}\n```\n\n**GOOD:**\n```dart\nclass Point {\n  int x, y;\n  Point(this.x, this.y);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "empty_statements",
    "description": "Avoid empty statements.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** empty statements.\n\nEmpty statements almost always indicate a bug.\n\nFor example,\n\n**BAD:**\n```dart\nif (complicated.expression.foo());\n  bar();\n```\n\nFormatted with `dart format` the bug becomes obvious:\n\n```dart\nif (complicated.expression.foo()) ;\nbar();\n\n```\n\nBetter to avoid the empty statement altogether.\n\n**GOOD:**\n```dart\nif (complicated.expression.foo())\n  bar();\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "enable_null_safety",
    "description": "Do use sound null safety.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.0.0; it is no longer functional.\n\n**DO** use sound null safety, by not specifying a dart version lower than `2.12`.\n\n**BAD:**\n```dart\n// @dart=2.8\na() {\n}\n```\n\n**GOOD:**\n```dart\nb() {\n}\n```",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "eol_at_end_of_file",
    "description": "Put a single newline at end of file.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** put a single newline at the end of non-empty files.\n\n**BAD:**\n```dart\na {\n}\n```\n\n**GOOD:**\n```dart\nb {\n}\n    <-- newline\n```",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "exhaustive_cases",
    "description": "Define case clauses for all constants in enum-like classes.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Switching on instances of enum-like classes should be exhaustive.\n\nEnum-like classes are defined as concrete (non-abstract) classes that have:\n  * only private non-factory constructors\n  * two or more static const fields whose type is the enclosing class and\n  * no subclasses of the class in the defining library\n\n**DO** define case clauses for all constants in enum-like classes.\n\n**BAD:**\n```dart\nclass EnumLike {\n  final int i;\n  const EnumLike._(this.i);\n\n  static const e = EnumLike._(1);\n  static const f = EnumLike._(2);\n  static const g = EnumLike._(3);\n}\n\nvoid bad(EnumLike e) {\n  // Missing case.\n  switch(e) { // LINT\n    case EnumLike.e :\n      print('e');\n      break;\n    case EnumLike.f :\n      print('f');\n      break;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass EnumLike {\n  final int i;\n  const EnumLike._(this.i);\n\n  static const e = EnumLike._(1);\n  static const f = EnumLike._(2);\n  static const g = EnumLike._(3);\n}\n\nvoid ok(EnumLike e) {\n  // All cases covered.\n  switch(e) { // OK\n    case EnumLike.e :\n      print('e');\n      break;\n    case EnumLike.f :\n      print('f');\n      break;\n    case EnumLike.g :\n      print('g');\n      break;\n  }\n}\n```",
    "sinceDartSdk": "2.9"
  },
  {
    "name": "file_names",
    "description": "Name source files using `lowercase_with_underscores`.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DO** name source files using `lowercase_with_underscores`.\n\nSome file systems are not case-sensitive, so many projects require filenames to\nbe all lowercase. Using a separating character allows names to still be readable\nin that form. Using underscores as the separator ensures that the name is still\na valid Dart identifier, which may be helpful if the language later supports\nsymbolic imports.\n\n**BAD:**\n\n* `SliderMenu.dart`\n* `filesystem.dart`\n* `file-system.dart`\n\n**GOOD:**\n\n* `slider_menu.dart`\n* `file_system.dart`\n\nFiles without a strict `.dart` extension are ignored.  For example:\n\n**OK:**\n\n* `file-system.g.dart`\n* `SliderMenu.css.dart`\n\nThe lint `library_names` can be used to enforce the same kind of naming on the\nlibrary.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "flutter_style_todos",
    "description": "Use Flutter TODO format: // TODO(username): message, https://URL-to-issue.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use Flutter TODO format.\n\nFrom the [Flutter\ndocs](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo#comments):\n\n> TODOs should include the string TODO in all caps, followed by the GitHub\nusername of the person with the best context about the problem referenced by the\nTODO in parenthesis. A TODO is not a commitment that the person referenced will\nfix the problem, it is intended to be the person with enough context to explain\nthe problem. Thus, when you create a TODO, it is almost always your username\nthat is given.\n\n**GOOD:**\n```dart\n// TODO(username): message.\n// TODO(username): message, https://URL-to-issue.\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "hash_and_equals",
    "description": "Always override `hashCode` if overriding `==`.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** override `hashCode` if overriding `==` and prefer overriding `==` if\noverriding `hashCode`.\n\nEvery object in Dart has a `hashCode`.  Both the `==` operator and the\n`hashCode` property of objects must be consistent in order for a common hash\nmap implementation to function properly.  Thus, when overriding `==`, the\n`hashCode` should also be overridden to maintain consistency. Similarly, if\n`hashCode` is overridden, `==` should be also.\n\n**BAD:**\n```dart\nclass Bad {\n  final int value;\n  Bad(this.value);\n\n  @override\n  bool operator ==(Object other) => other is Bad && other.value == value;\n}\n```\n\n**GOOD:**\n```dart\nclass Better {\n  final int value;\n  Better(this.value);\n\n  @override\n  bool operator ==(Object other) =>\n      other is Better &&\n      other.runtimeType == runtimeType &&\n      other.value == value;\n\n  @override\n  int get hashCode => value.hashCode;\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "implementation_imports",
    "description": "Don't import implementation files from another package.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "From the the [pub package layout doc](https://dart.dev/tools/pub/package-layout#implementation-files):\n\n**DON'T** import implementation files from another package.\n\nThe libraries inside `lib` are publicly visible: other packages are free to\nimport them.  But much of a package's code is internal implementation libraries\nthat should only be imported and used by the package itself.  Those go inside a\nsubdirectory of `lib` called `src`.  You can create subdirectories in there if\nit helps you organize things.\n\nYou are free to import libraries that live in `lib/src` from within other Dart\ncode in the same package (like other libraries in `lib`, scripts in `bin`,\nand tests) but you should never import from another package's `lib/src`\ndirectory.  Those files are not part of the package's public API, and they\nmight change in ways that could break your code.\n\n**BAD:**\n```dart\n// In 'road_runner'\nimport 'package:acme/src/internals.dart';\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "implicit_call_tearoffs",
    "description": "Explicitly tear-off `call` methods when using an object as a Function.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO**\nExplicitly tear off `.call` methods from objects when assigning to a Function\ntype. There is less magic with an explicit tear off. Future language versions\nmay remove the implicit call tear off.\n\n**BAD:**\n```dart\nclass Callable {\n  void call() {}\n}\nvoid callIt(void Function() f) {\n  f();\n}\n\ncallIt(Callable());\n```\n\n**GOOD:**\n```dart\nclass Callable {\n  void call() {}\n}\nvoid callIt(void Function() f) {\n  f();\n}\n\ncallIt(Callable().call);\n```",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "implicit_reopen",
    "description": "Don't implicitly reopen classes.",
    "categories": [
      "errorProne"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Using an `interface`, `base`, `final`, or `sealed` modifier on a class,\nor a `base` modifier on a mixin,\nauthors can control whether classes and mixins allow being implemented,\nextended, and/or mixed in from outside of the library where they're defined.\nIn some cases, it's possible for an author to inadvertently relax these controls\nand implicitly \"reopen\" a class. (A similar reopening cannot occur with a mixin.)\n\nThis lint guards against unintentionally reopening a class by requiring such\ncases to be made explicit with the\n[`@reopen`](https://pub.dev/documentation/meta/latest/meta/reopen-constant.html)\nannotation in `package:meta`.\n\n**BAD:**\n```dart\ninterface class I {}\n\nclass C extends I {} // LINT\n```\n\n**GOOD:**\n```dart\ninterface class I {}\n\nfinal class C extends I {}\n```\n\n```dart\nimport 'package:meta/meta.dart';\n\ninterface class I {}\n\n@reopen\nclass C extends I {}\n```",
    "sinceDartSdk": "3.0"
  },
  {
    "name": "invalid_case_patterns",
    "description": "Use case expressions that are valid in Dart 3.0.",
    "categories": [
      "languageFeatureUsage"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Some case expressions that are valid in Dart 2.19 and below will become an error\nor have changed semantics when a library is upgraded to 3.0. This lint flags\nthose expressions in order to ease migration to Dart 3.0.\n\nSome valid switch cases in 2.19 will become compile errors in Dart 3.0:\n\n* Set literals\n* Parenthesized expressions\n* Calls to `identical()`.\n* Unary operator expressions `!`, `-`, or `~` (except for `-` before an integer\n  literal, which is a valid pattern and is fine)\n* Binary operator expressions `!=`, `==`, `&`, `|`, `^`, `~/`, `>>`, `>>>`,\n  `<<`, `+`, `-`, `*`, `/`, `%`, `<`, `<=`, `>`, `>=`, `??`.\n* Conditional operator `?:`\n* `.length` calls on strings\n* `is` and `is!` expressions\n\nExamples of all of them:\n\n```dart\nswitch (obj) {\n  case {1}: // Set literal.\n  case (1): // Parenthesized expression.\n  case identical(1, 2): // `identical()` call.\n  case -pi: // Unary operator.\n  case 1 + 2: // Binary operator.\n  case true ? 1 : 2: // Conditional operator.\n  case 'hi'.length: // .length call.\n  case i is int: // is expression.\n}\n```\n\nSome valid switch cases in 2.19 are also syntactically valid patterns, but the\npattern matching behavior may be different from the current constant equality\nbehavior. They are:\n\n**List and map literals.** A list or map literal can appear as a constant in a\ncase:\n\n```dart\nswitch (obj) {\n  case [1, 2]: ...\n  case {'k': 'v'}: ...\n}\n```\n\nCurrently, the case will only match if the incoming value has the same identity\nas the constant. So:\n\n```dart\ntest(List<int> list) {\n  switch (list) {\n    case [1, 2]: print('Matched'); break;\n    default: print('Did not match'); break;\n  }\n}\n\nmain() {\n  test(const [1, 2]); // Prints \"Matched\".\n  test([1, 2]); // Prints \"Did not match\".\n}\n```\n\nWith patterns, a list or map literal becomes a list or map pattern. The pattern\ndestructures the incoming object and matches if the subpatterns all match. In\nother words, list and map pattern match using something more like deep equality.\n\nWith Dart 3.0, the above program prints \"Matched\" twice.\n\n**Constant constructor calls.** Similar to collections, you can construct a\nconstant instance of a class in a case:\n\n```dart\nclass Point {\n  final int x;\n  final int y;\n  const Point({this.x, this.y});\n}\n\ntest(Point p) {\n  switch (p) {\n    case Point(x: 1, y: 2): print('Matched'); break;\n    default: print('Did not match'); break;\n  }\n}\n\nmain() {\n  test(const Point(1, 2)); // Prints \"Matched\".\n  test(Point(1, 2)); // Prints \"Did not match\".\n}\n```\n\nAgain, like collections, the case currently only matches if the incoming value\nhas the same identity. With patterns, the `Point(...)` syntax becomes an object\npattern that destructures the incoming point, calls the `x` and `y` getters on\nit and then matches the results of those against the corresponding subpatterns.\n\nIn this example, it will print \"Matched\" twice.\n\nNote that object patterns only support named fields. So any constant constructor\nin a case today that has positional arguments will become a compile-time error\nwhen parsed as a pattern. A constant constructor call with no arguments is a\nvalid object pattern and only does a type test:\n\n```dart\nclass Thing {\n  const Thing();\n}\n\ntest(Thing t) {\n  switch (t) {\n    case Thing(): print('Matched'); break;\n    default: print('Did not match'); break;\n  }\n}\n\nmain() {\n  test(const Thing()); // Prints \"Matched\".\n  test(Thing()); // Prints \"Did not match\".\n}\n```\n\nWhen interpreted as a pattern, this prints \"Matched\" twice.\n\n**Wildcards.** Today, you can have a constant named `_`:\n\n```dart\ntest(int n) {\n  const _ = 3;\n  switch (n) {\n    case _: print('Matched'); break;\n    default: print('Did not match'); break;\n  }\n}\n\nmain() {\n  test(3); // Prints \"Matched\".\n  test(5); // Prints \"Did not match\".\n}\n```\n\nWith patterns, the identifier `_` is treated as a pattern that matches all\nvalues, so this prints \"Matched\" twice.\n\n**Logic operators.** The logic operators `&&` and `||` are valid constant\nexpressions and also valid patterns. As a constant expression, they simply\nevaluate the expression to a boolean and match if the incoming value is equal to\nthat boolean value. So:\n\n```dart\ntest(bool b) {\n  switch (b) {\n    case true && false: print('Matched'); break;\n    default: print('Did not match'); break;\n  }\n}\n\nmain() {\n  test(false); // Prints \"Matched\".\n  test(true); // Prints \"Did not match\".\n}\n```\n\nWith Dart 3.0, these become patterns. The above example prints \"Did not match\"\ntwice because no boolean value can be both true and false.\n\nMany of invalid cases can be mechanically changed to something that is valid\nboth in Dart today and valid and means the same in Dart 3.0.\n\n**Parenthesized expressions:** Provided the inner expression is one that's not\nbroken in Dart 3.0, just discard the parentheses.\n\n**List literals, map literals, set literals, and constant constructor calls:**\nPut `const` before the literal or call. This turns it into a constant pattern\nwhich preserves the current behavior:\n\n**BAD:**\n\n```dart\ncase [1, 2]:\ncase {'k': 'v'}:\ncase {1, 2}:\ncase Point(1, 2):\n```\n\n**GOOD:**\n\n```dart\ncase const [1, 2]:\ncase const {'k': 'v'}:\ncase const {1, 2}:\ncase const Point(1, 2):\n```\n\n* **Wildcards:** Rename the constant from `_` to something else. Since the name\nis private, this can be done locally in the library without affecting other\ncode.\n\n* **Everything else:** For any other invalid expression, you have to hoist the\nexpression out into a new named constant. For example, if you have code like\nthis:\n\n\n**BAD:**\n\n```dart\nswitch (n) {\n  case 1 + 2: ...\n}\n```\n\nIt can be fixed by changing it to:\n\n**GOOD:**\n\n ```dart\nconst three = 1 + 2;\n\nswitch (n) {\n  case three: ...\n}\n```",
    "sinceDartSdk": "3.0"
  },
  {
    "name": "invalid_runtime_check_with_js_interop_types",
    "description": "Avoid runtime type tests with JS interop types where the result may not\n    be platform-consistent.",
    "categories": [
      "errorProne",
      "web"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "needsEvaluation",
    "details": "**DON'T** use `is` checks where the type is a JS interop type.\n\n**DON'T** use `is` checks where the type is a generic Dart type that has JS\ninterop type arguments.\n\n**DON'T** use `is` checks with a JS interop value.\n\n`dart:js_interop` types have runtime types that are different based on whether\nyou are compiling to JS or to Wasm. Therefore, runtime type checks may result in\ndifferent behavior. Runtime checks also do not necessarily check that a JS\ninterop value is a particular JavaScript type.\n\n**BAD:**\n```dart\nextension type HTMLElement(JSObject o) {}\nextension type HTMLDivElement(JSObject o) implements HTMLElement {}\n\nvoid compute(JSAny a, bool b, List<JSObject> lo, List<String> ls, JSObject o,\n    HTMLElement e) {\n  a is String; // LINT, checking that a JS value is a Dart type\n  b is JSBoolean; // LINT, checking that a Dart value is a JS type\n  a is JSString; // LINT, checking that a JS value is a different JS interop\n                 // type\n  o is JSNumber; // LINT, checking that a JS value is a different JS interop\n                 // type\n  lo is List<String>; // LINT, JS interop type argument and Dart type argument\n                      // are incompatible\n  ls is List<JSString>; // LINT, Dart type argument and JS interop type argument\n                        // are incompatible\n  lo is List<JSArray>; // LINT, comparing JS interop type argument with\n                       // different JS interop type argument\n  lo is List<JSNumber>; // LINT, comparing JS interop type argument with\n                        // different JS interop type argument\n  o is HTMLElement; // LINT, true because both are JSObjects but doesn't check\n                    // that it's a JS HTMLElement\n  e is HTMLDivElement; // LINT, true because both are JSObjects but doesn't\n                       // check that it's a JS HTMLDivElement\n}\n```\n\nPrefer using JS interop helpers like `isA` from `dart:js_interop` to check the\nunderlying type of JS interop values.\n\n**GOOD:**\n```dart\nextension type HTMLElement(JSObject o) implements JSObject {}\nextension type HTMLDivElement(JSObject o) implements HTMLElement {}\n\nvoid compute(JSAny a, List<JSAny> l, JSObject o, HTMLElement e) {\n  a.isA<JSString>; // OK, uses JS interop to check it is a JS string\n  l[0].isA<JSString>; // OK, uses JS interop to check it is a JS string\n  o.isA<HTMLElement>(); // OK, uses JS interop to check `o` is an HTMLElement\n  e.isA<HTMLDivElement>(); // OK, uses JS interop to check `e` is an\n                           // HTMLDivElement\n}\n```\n\n**DON'T** use `as` to cast a JS interop value to an unrelated Dart type or an\nunrelated Dart value to a JS interop type.\n\n**DON'T** use `as` to cast a JS interop value to a JS interop type represented\nby an incompatible `dart:js_interop` type.\n\n**BAD:**\n```dart\nextension type Window(JSObject o) {}\n\nvoid compute(String s, JSBoolean b, Window w, List<String> l,\n    List<JSObject> lo) {\n  s as JSString; // LINT, casting Dart type to JS interop type\n  b as bool; // LINT, casting JS interop type to Dart type\n  b as JSNumber; // LINT, JSBoolean and JSNumber are incompatible\n  b as Window; // LINT, JSBoolean and JSObject are incompatible\n  w as JSBoolean; // LINT, JSObject and JSBoolean are incompatible\n  l as List<JSString>; // LINT, casting Dart value with Dart type argument to\n                       // Dart type with JS interop type argument\n  lo as List<String>; // LINT, casting Dart value with JS interop type argument\n                      // to Dart type with Dart type argument\n  lo as List<JSBoolean>; // LINT, casting Dart value with JS interop type\n                         // argument to Dart type with incompatible JS interop\n                         // type argument\n}\n```\n\nPrefer using `dart:js_interop` conversion methods to convert a JS interop value\nto a Dart value and vice versa.\n\n**GOOD:**\n```dart\nextension type Window(JSObject o) {}\nextension type Document(JSObject o) {}\n\nvoid compute(String s, JSBoolean b, Window w, JSArray<JSString> a,\n    List<String> ls, JSObject o, List<JSAny> la) {\n  s.toJS; // OK, converts the Dart type to a JS type\n  b.toDart; // OK, converts the JS type to a Dart type\n  a.toDart; // OK, converts the JS type to a Dart type\n  w as Document; // OK, but no runtime check that `w` is a JS Document\n  ls.map((e) => e.toJS).toList(); // OK, converts the Dart types to JS types\n  o as JSArray<JSString>; // OK, JSObject and JSArray are compatible\n  la as List<JSString>; // OK, JSAny and JSString are compatible\n  (o as Object) as JSObject; // OK, Object is a supertype of JSAny\n}\n```",
    "sinceDartSdk": "3.5"
  },
  {
    "name": "invariant_booleans",
    "description": "Conditions should not unconditionally evaluate to `true` or to `false`.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.0.0; it is no longer functional.\n\n**DON'T** test for conditions that can be inferred at compile time or test the\nsame condition twice.\n\nConditional statements using a condition which cannot be anything but `false`\nhave the effect of making blocks of code non-functional.  If the condition\ncannot evaluate to anything but `true`, the conditional statement is completely\nredundant, and makes the code less readable.\nIt is quite likely that the code does not match the programmer's intent.\nEither the condition should be removed or it should be updated so that it does\nnot always evaluate to `true` or `false` and does not perform redundant tests.\nThis rule will hint to the test conflicting with the linted one.\n\n**BAD:**\n```dart\n// foo can't be both equal and not equal to bar in the same expression\nif(foo == bar && something && foo != bar) {...}\n```\n\n**BAD:**\n```dart\nvoid compute(int foo) {\n  if (foo == 4) {\n    doSomething();\n    // we know foo is equal to 4 at this point, so the next condition is always false\n    if (foo > 4) {...}\n    ...\n  }\n  ...\n}\n```\n\n**BAD:**\n```dart\nvoid compute(bool foo) {\n  if (foo) {\n    return;\n  }\n  doSomething();\n  // foo is always false here\n  if (foo){...}\n  ...\n}\n```\n\n**GOOD:**\n```dart\nvoid nestedOK() {\n  if (foo == bar) {\n    foo = baz;\n    if (foo != bar) {...}\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid nestedOk2() {\n  if (foo == bar) {\n    return;\n  }\n\n  foo = baz;\n  if (foo == bar) {...} // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid nestedOk5() {\n  if (foo != null) {\n    if (bar != null) {\n      return;\n    }\n  }\n\n  if (bar != null) {...} // OK\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "iterable_contains_unrelated_type",
    "description": "Invocation of `Iterable<E>.contains` with references of unrelated types.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.3.0; it is no longer functional.\n\n**DON'T** invoke `contains` on `Iterable` with an instance of different type\nthan the parameter type.\n\nDoing this will invoke `==` on its elements and most likely will return `false`.\n\n**BAD:**\n```dart\nvoid someFunction() {\n  var list = <int>[];\n  if (list.contains('1')) print('someFunction'); // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction3() {\n  List<int> list = <int>[];\n  if (list.contains('1')) print('someFunction3'); // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction8() {\n  List<DerivedClass2> list = <DerivedClass2>[];\n  DerivedClass3 instance;\n  if (list.contains(instance)) print('someFunction8'); // LINT\n}\n```\n\n**BAD:**\n```dart\nabstract class SomeIterable<E> implements Iterable<E> {}\n\nabstract class MyClass implements SomeIterable<int> {\n  bool badMethod(String thing) => this.contains(thing); // LINT\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction10() {\n  var list = [];\n  if (list.contains(1)) print('someFunction10'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction1() {\n  var list = <int>[];\n  if (list.contains(1)) print('someFunction1'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction4() {\n  List<int> list = <int>[];\n  if (list.contains(1)) print('someFunction4'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction5() {\n  List<ClassBase> list = <ClassBase>[];\n  DerivedClass1 instance;\n  if (list.contains(instance)) print('someFunction5'); // OK\n}\n\nabstract class ClassBase {}\n\nclass DerivedClass1 extends ClassBase {}\n```\n\n**GOOD:**\n```dart\nvoid someFunction6() {\n  List<Mixin> list = <Mixin>[];\n  DerivedClass2 instance;\n  if (list.contains(instance)) print('someFunction6'); // OK\n}\n\nabstract class ClassBase {}\n\nabstract class Mixin {}\n\nclass DerivedClass2 extends ClassBase with Mixin {}\n```\n\n**GOOD:**\n```dart\nvoid someFunction7() {\n  List<Mixin> list = <Mixin>[];\n  DerivedClass3 instance;\n  if (list.contains(instance)) print('someFunction7'); // OK\n}\n\nabstract class ClassBase {}\n\nabstract class Mixin {}\n\nclass DerivedClass3 extends ClassBase implements Mixin {}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "join_return_with_assignment",
    "description": "Join return statement with assignment when possible.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** join return statement with assignment when possible.\n\n**BAD:**\n```dart\nclass A {\n  B _lazyInstance;\n  static B get instance {\n    _lazyInstance ??= B(); // LINT\n    return _lazyInstance;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  B _lazyInstance;\n  static B get instance => _lazyInstance ??= B();\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "leading_newlines_in_multiline_strings",
    "description": "Start multiline strings with a newline.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Multiline strings are easier to read when they start with a newline (a newline\nstarting a multiline string is ignored).\n\n**BAD:**\n```dart\nvar s1 = '''{\n  \"a\": 1,\n  \"b\": 2\n}''';\n```\n\n**GOOD:**\n```dart\nvar s1 = '''\n{\n  \"a\": 1,\n  \"b\": 2\n}''';\n\nvar s2 = '''This one-liner multiline string is ok. It usually allows to escape both ' and \" in the string.''';\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "library_annotations",
    "description": "Attach library annotations to library directives.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Attach library annotations to library directives, rather than\nsome other library-level element.\n\n**BAD:**\n```dart\n@TestOn('browser')\n\nimport 'package:test/test.dart';\n\nvoid main() {}\n```\n\n**GOOD:**\n```dart\n@TestOn('browser')\nlibrary;\n\nimport 'package:test/test.dart';\n\nvoid main() {}\n```\n\n**NOTE:** An unnamed library, like `library;` above, is only supported in Dart\n2.19 and later. Code which might run in earlier versions of Dart will need to\nprovide a name in the `library` directive.",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "library_names",
    "description": "Name libraries using `lowercase_with_underscores`.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** name libraries using `lowercase_with_underscores`.\n\nSome file systems are not case-sensitive, so many projects require filenames to\nbe all lowercase. Using a separating character allows names to still be readable\nin that form. Using underscores as the separator ensures that the name is still\na valid Dart identifier, which may be helpful if the language later supports\nsymbolic imports.\n\n**BAD:**\n```dart\nlibrary peg-parser;\n```\n\n**GOOD:**\n```dart\nlibrary peg_parser;\n```\n\nThe lint `file_names` can be used to enforce the same kind of naming on the\nfile.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "library_prefixes",
    "description": "Use `lowercase_with_underscores` when specifying a library prefix.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DO** use `lowercase_with_underscores` when specifying a library prefix.\n\n**BAD:**\n```dart\nimport 'dart:math' as Math;\nimport 'dart:json' as JSON;\nimport 'package:js/js.dart' as JS;\nimport 'package:javascript_utils/javascript_utils.dart' as jsUtils;\n```\n\n**GOOD:**\n```dart\nimport 'dart:math' as math;\nimport 'dart:json' as json;\nimport 'package:js/js.dart' as js;\nimport 'package:javascript_utils/javascript_utils.dart' as js_utils;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "library_private_types_in_public_api",
    "description": "Avoid using private types in public APIs.",
    "categories": [
      "publicInterface"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**AVOID** using library private types in public APIs.\n\nFor the purposes of this lint, a public API is considered to be any top-level or\nmember declaration unless the declaration is library private or contained in a\ndeclaration that's library private. The following uses of types are checked:\n\n- the return type of a function or method,\n- the type of any parameter of a function or method,\n- the bound of a type parameter to any function, method, class, mixin,\n  extension's extended type, or type alias,\n- the type of any top level variable or field,\n- any type used in the declaration of a type alias (for example\n  `typedef F = _Private Function();`), or\n- any type used in the `on` clause of an extension or a mixin\n\n**BAD:**\n```dart\nf(_Private p) { ... }\nclass _Private {}\n```\n\n**GOOD:**\n```dart\nf(String s) { ... }\n```",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "lines_longer_than_80_chars",
    "description": "Avoid lines longer than 80 characters.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**AVOID** lines longer than 80 characters\n\nReadability studies show that long lines of text are harder to read because your\neye has to travel farther when moving to the beginning of the next line. This is\nwhy newspapers and magazines use multiple columns of text.\n\nIf you really find yourself wanting lines longer than 80 characters, our\nexperience is that your code is likely too verbose and could be a little more\ncompact. The main offender is usually `VeryLongCamelCaseClassNames`. Ask\nyourself, “Does each word in that type name tell me something critical or\nprevent a name collision?” If not, consider omitting it.\n\nNote that `dart format` does 99% of this for you, but the last 1% is you. It\ndoes not split long string literals to fit in 80 columns, so you have to do\nthat manually.\n\nWe make an exception for URIs and file paths. When those occur in comments or\nstrings (usually in imports and exports), they may remain on a single line even\nif they go over the line limit. This makes it easier to search source files for\na given path.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "list_remove_unrelated_type",
    "description": "Invocation of `remove` with references of unrelated types.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.3.0; it is no longer functional.\n\n**DON'T** invoke `remove` on `List` with an instance of different type than\nthe parameter type.\n\nDoing this will invoke `==` on its elements and most likely will\nreturn `false`.\n\n**BAD:**\n```dart\nvoid someFunction() {\n  var list = <int>[];\n  if (list.remove('1')) print('someFunction'); // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction3() {\n  List<int> list = <int>[];\n  if (list.remove('1')) print('someFunction3'); // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction8() {\n  List<DerivedClass2> list = <DerivedClass2>[];\n  DerivedClass3 instance;\n  if (list.remove(instance)) print('someFunction8'); // LINT\n}\n```\n\n**BAD:**\n```dart\nabstract class SomeList<E> implements List<E> {}\n\nabstract class MyClass implements SomeList<int> {\n  bool badMethod(String thing) => this.remove(thing); // LINT\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction10() {\n  var list = [];\n  if (list.remove(1)) print('someFunction10'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction1() {\n  var list = <int>[];\n  if (list.remove(1)) print('someFunction1'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction4() {\n  List<int> list = <int>[];\n  if (list.remove(1)) print('someFunction4'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction5() {\n  List<ClassBase> list = <ClassBase>[];\n  DerivedClass1 instance;\n  if (list.remove(instance)) print('someFunction5'); // OK\n}\n\nabstract class ClassBase {}\n\nclass DerivedClass1 extends ClassBase {}\n```\n\n**GOOD:**\n```dart\nvoid someFunction6() {\n  List<Mixin> list = <Mixin>[];\n  DerivedClass2 instance;\n  if (list.remove(instance)) print('someFunction6'); // OK\n}\n\nabstract class ClassBase {}\n\nabstract class Mixin {}\n\nclass DerivedClass2 extends ClassBase with Mixin {}\n```\n\n**GOOD:**\n```dart\nvoid someFunction7() {\n  List<Mixin> list = <Mixin>[];\n  DerivedClass3 instance;\n  if (list.remove(instance)) print('someFunction7'); // OK\n}\n\nabstract class ClassBase {}\n\nabstract class Mixin {}\n\nclass DerivedClass3 extends ClassBase implements Mixin {}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "literal_only_boolean_expressions",
    "description": "Boolean expression composed only with literals.",
    "categories": [
      "unusedCode"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DON'T** test for conditions composed only by literals, since the value can be\ninferred at compile time.\n\nConditional statements using a condition which cannot be anything but FALSE have\nthe effect of making blocks of code non-functional.  If the condition cannot\nevaluate to anything but `true`, the conditional statement is completely\nredundant, and makes the code less readable.\nIt is quite likely that the code does not match the programmer's intent.\nEither the condition should be removed or it should be updated so that it does\nnot always evaluate to `true` or `false`.\n\n**BAD:**\n```dart\nvoid bad() {\n  if (true) {} // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid bad() {\n  if (true && 1 != 0) {} // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid bad() {\n  if (1 != 0 && true) {} // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid bad() {\n  if (1 < 0 && true) {} // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid bad() {\n  if (true && false) {} // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid bad() {\n  if (1 != 0) {} // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid bad() {\n  if (true && 1 != 0 || 3 < 4) {} // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid bad() {\n  if (1 != 0 || 3 < 4 && true) {} // LINT\n}\n```\n\n**NOTE:** that an exception is made for the common `while (true) { }` idiom,\nwhich is often reasonably preferred to the equivalent `for (;;)`.\n\n**GOOD:**\n```dart\nvoid good() {\n  while (true) {\n    // Do stuff.\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "matching_super_parameters",
    "description": "Use matching super parameter names.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** use super parameter names that match their corresponding super\nconstructor's parameter names.\n\n**BAD:**\n\n```dart\nclass Rectangle {\n  final int width;\n  final int height;\n\n  Rectangle(this.width, this.height);\n}\n\nclass ColoredRectangle extends Rectangle {\n  final Color color;\n\n  ColoredRectangle(\n    this.color,\n    super.height, // Bad, actually corresponds to the `width` parameter.\n    super.width, // Bad, actually corresponds to the `height` parameter.\n  );\n}\n```\n\n**GOOD:**\n\n```dart\nclass Rectangle {\n  final int width;\n  final int height;\n\n  Rectangle(this.width, this.height);\n}\n\nclass ColoredRectangle extends Rectangle {\n  final Color color;\n\n  ColoredRectangle(\n    this.color,\n    super.width,\n    super.height,\n  );\n}\n```",
    "sinceDartSdk": "3.0"
  },
  {
    "name": "missing_code_block_language_in_doc_comment",
    "description": "A code block is missing a specified language.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsEvaluation",
    "details": "**DO** specify the language used in the code block of a doc comment.\n\nTo enable proper syntax highlighting of Markdown code blocks,\n[`dart doc`](https://dart.dev/tools/dart-doc) strongly recommends code blocks to\nspecify the language used after the initial code fence.\n\nSee [highlight.js](https://github.com/highlightjs/highlight.js/blob/main/SUPPORTED_LANGUAGES.md)\nfor the list of languages supported by `dart doc`.\nTo disable syntax highlighting or if no language is suitable,\nyou can specify `none` as the language.\n\n**BAD:**\n```dart\n/// ```\n/// void main() {}\n/// ```\nclass A {}\n```\n\n**GOOD:**\n```dart\n/// ```dart\n/// void main() {}\n/// ```\nclass A {}\n```",
    "sinceDartSdk": "3.4"
  },
  {
    "name": "missing_whitespace_between_adjacent_strings",
    "description": "Missing whitespace between adjacent strings.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Add a trailing whitespace to prevent missing whitespace between adjacent\nstrings.\n\nWith long text split across adjacent strings it's easy to forget a whitespace\nbetween strings.\n\n**BAD:**\n```dart\nvar s =\n  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'\n  'do eiusmod tempor incididunt ut labore et dolore magna';\n```\n\n**GOOD:**\n```dart\nvar s =\n  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed '\n  'do eiusmod tempor incididunt ut labore et dolore magna';\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "no_adjacent_strings_in_list",
    "description": "Don't use adjacent strings in list.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DON'T** use adjacent strings in a list.\n\nThis can indicate a forgotten comma.\n\n**BAD:**\n```dart\nList<String> list = <String>[\n  'a'\n  'b',\n  'c',\n];\n```\n\n**GOOD:**\n```dart\nList<String> list = <String>[\n  'a' +\n  'b',\n  'c',\n];\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "no_default_cases",
    "description": "No default cases.",
    "categories": [
      "style"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Switches on enums and enum-like classes should not use a `default` clause.\n\nEnum-like classes are defined as concrete (non-abstract) classes that have:\n  * only private non-factory constructors\n  * two or more static const fields whose type is the enclosing class and\n  * no subclasses of the class in the defining library\n\n**DO** define default behavior outside switch statements.\n\n**BAD:**\n```dart\n  switch (testEnum) {\n    case TestEnum.A:\n      return '123';\n    case TestEnum.B:\n      return 'abc';\n    default:\n      return null;\n  }\n```\n\n**GOOD:**\n```dart\n  switch (testEnum) {\n    case TestEnum.A:\n      return '123';\n    case TestEnum.B:\n      return 'abc';\n  }\n  // Default here.\n  return null;\n```",
    "sinceDartSdk": "2.9"
  },
  {
    "name": "no_duplicate_case_values",
    "description": "Don't use more than one case with same value.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** use more than one case with same value.\n\nThis is usually a typo or changed value of constant.\n\n**BAD:**\n```dart\nconst int A = 1;\nswitch (v) {\n  case 1:\n  case 2:\n  case A:\n  case 2:\n}\n```\n\n**GOOD:**\n```dart\nconst int A = 1;\nswitch (v) {\n  case A:\n  case 2:\n}\n```\n\nNOTE: this lint only reports duplicate cases in libraries opted in to Dart 2.19\nand below. In Dart 3.0 and after, duplicate cases are reported as dead code\nby the analyzer.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "no_leading_underscores_for_library_prefixes",
    "description": "Avoid leading underscores for library prefixes.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** use a leading underscore for library prefixes.\nThere is no concept of \"private\" for library prefixes. When one of those has a\nname that starts with an underscore, it sends a confusing signal to the reader.\nTo avoid that, don't use leading underscores in those names.\n\n**BAD:**\n```dart\nimport 'dart:core' as _core;\n```\n\n**GOOD:**\n```dart\nimport 'dart:core' as core;\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "no_leading_underscores_for_local_identifiers",
    "description": "Avoid leading underscores for local identifiers.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** use a leading underscore for identifiers that aren't private. Dart\nuses a leading underscore in an identifier to mark members and top-level\ndeclarations as private. This trains users to associate a leading underscore\nwith one of those kinds of declarations. They see `_` and  think \"private\".\nThere is no concept of \"private\" for local variables or parameters.  When one of\nthose has a name that starts with an underscore, it sends a confusing signal to\nthe reader. To avoid that, don't use leading underscores in those names.\n\n**EXCEPTION:**: An unused parameter can be named `_`, `__`, `___`, etc.  This is\ncommon practice in callbacks where you are passed a value but you don't need\nto use it. Giving it a name that consists solely of underscores is the idiomatic\nway to indicate that the value isn't used.\n\n**BAD:**\n```dart\nvoid print(String _name) {\n  var _size = _name.length;\n  ...\n}\n```\n**GOOD:**\n\n```dart\nvoid print(String name) {\n  var size = name.length;\n  ...\n}\n```\n\n**OK:**\n\n```dart\n[1,2,3].map((_) => print('Hello'));\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "no_literal_bool_comparisons",
    "description": "Don't compare boolean expressions to boolean literals.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#dont-use-true-or-false-in-equality-operations):\n\n**DON'T** use `true` or `false` in equality operations.\n\nThis lint applies only if the expression is of a non-nullable `bool` type.\n\n**BAD:**\n```dart\nif (someBool == true) {\n  print('true!');\n}\nwhile (someBool == false) {\n  print('still false!');\n}\n```\n\n**GOOD:**\n```dart\nif (someBool) {\n  print('true!');\n}\nwhile (!someBool) {\n  print('still false!');\n}\n```",
    "sinceDartSdk": "3.0"
  },
  {
    "name": "no_logic_in_create_state",
    "description": "Don't put any logic in createState.",
    "categories": [
      "errorProne",
      "flutter"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DON'T** put any logic in `createState()`.\n\nImplementations of  `createState()` should return a new instance\nof a State object and do nothing more.  Since state access is preferred\nvia the `widget` field,  passing data to `State` objects using custom\nconstructor parameters should also be avoided and so further, the State\nconstructor is required to be passed no arguments.\n\n**BAD:**\n```dart\nMyState global;\n\nclass MyStateful extends StatefulWidget {\n  @override\n  MyState createState() {\n    global = MyState();\n    return global;\n  }\n}\n```\n\n```dart\nclass MyStateful extends StatefulWidget {\n  @override\n  MyState createState() => MyState()..field = 42;\n}\n```\n\n```dart\nclass MyStateful extends StatefulWidget {\n  @override\n  MyState createState() => MyState(42);\n}\n```\n\n\n**GOOD:**\n```dart\nclass MyStateful extends StatefulWidget {\n  @override\n  MyState createState() {\n    return MyState();\n  }\n}\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "no_runtimeType_toString",
    "description": "Avoid calling `toString()` on `runtimeType`.",
    "categories": [
      "nonPerformant"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "Calling `toString` on a runtime type is a non-trivial operation that can\nnegatively impact performance. It's better to avoid it.\n\n**BAD:**\n```dart\nclass A {\n  String toString() => '$runtimeType()';\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  String toString() => 'A()';\n}\n```\n\nThis lint has some exceptions where performance is not a problem or where real\ntype information is more important than performance:\n\n* in an assertion\n* in a throw expression\n* in a catch clause\n* in a mixin declaration\n* in an abstract class declaration",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "no_self_assignments",
    "description": "Don't assign a variable to itself.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsEvaluation",
    "details": "**DON'T** assign a variable to itself. Usually this is a mistake.\n\n**BAD:**\n```dart\nclass C {\n  int x;\n\n  C(int x) {\n    x = x;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass C {\n  int x;\n\n  C(int x) : x = x;\n}\n```\n\n**GOOD:**\n```dart\nclass C {\n  int x;\n\n  C(int x) {\n    this.x = x;\n  }\n}\n```\n\n**BAD:**\n```dart\nclass C {\n  int _x = 5;\n\n  int get x => _x;\n\n  set x(int x) {\n    _x = x;\n    _customUpdateLogic();\n  }\n\n  void _customUpdateLogic() {\n    print('updated');\n  }\n\n  void example() {\n    x = x;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass C {\n  int _x = 5;\n\n  int get x => _x;\n\n  set x(int x) {\n    _x = x;\n    _customUpdateLogic();\n  }\n\n  void _customUpdateLogic() {\n    print('updated');\n  }\n\n  void example() {\n    _customUpdateLogic();\n  }\n}\n```\n\n**BAD:**\n```dart\nclass C {\n  int x = 5;\n\n  void update(C other) {\n    this.x = this.x;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass C {\n  int x = 5;\n\n  void update(C other) {\n    this.x = other.x;\n  }\n}\n```",
    "sinceDartSdk": "3.1"
  },
  {
    "name": "no_wildcard_variable_uses",
    "description": "Don't use wildcard parameters or variables.",
    "categories": [
      "languageFeatureUsage",
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "needsEvaluation",
    "details": "**DON'T** use wildcard parameters or variables.\n\nWildcard parameters and local variables\n(e.g. underscore-only names like `_`, `__`, `___`, etc.) will\nbecome non-binding in a future version of the Dart language.\nAny existing code that uses wildcard parameters or variables will\nbreak. In anticipation of this change, and to make adoption easier,\nthis lint disallows wildcard and variable parameter uses.\n\n\n**BAD:**\n```dart\nvar _ = 1;\nprint(_); // LINT\n```\n\n```dart\nvoid f(int __) {\n  print(__); // LINT multiple underscores too\n}\n```\n\n**GOOD:**\n```dart\nfor (var _ in [1, 2, 3]) count++;\n```\n\n```dart\nvar [a, _, b, _] = [1, 2, 3, 4];\n```",
    "sinceDartSdk": "3.1"
  },
  {
    "name": "non_constant_identifier_names",
    "description": "Name non-constant identifiers using lowerCamelCase.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** name non-constant identifiers using lowerCamelCase.\n\nClass members, top-level definitions, variables, parameters, named parameters\nand named constructors should capitalize the first letter of each word\nexcept the first word, and use no separators.\n\n**GOOD:**\n```dart\nvar item;\n\nHttpRequest httpRequest;\n\nalign(clearItems) {\n  // ...\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "noop_primitive_operations",
    "description": "Noop primitive operations.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Some operations on primitive types are idempotent and can be removed.\n\n**BAD:**\n\n```dart\ndoubleValue.toDouble();\n\nintValue.toInt();\nintValue.round();\nintValue.ceil();\nintValue.floor();\nintValue.truncate();\n\nstring.toString();\nstring = 'hello\\n'\n    ''\n    'world';\n\n'string with ${x.toString()}';\n```\n\nNote that the empty string literals at the beginning or end of a string are\nallowed, as they are typically used to format the string literal across multiple\nlines:\n\n```dart\n// OK\nstring = ''\n    'hello\\n'\n    'world\\n';\n\n// OK\nstring = 'hello\\n'\n    'world\\n'\n    '';\n```",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "null_check_on_nullable_type_parameter",
    "description": "Don't use `null` check on a potentially nullable type parameter.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** use `null` check on a potentially nullable type parameter.\n\nGiven a generic type parameter `T` which has a nullable bound (e.g., the default\nbound of `Object?`), it is very easy to introduce erroneous `null` checks when\nworking with a variable of type `T?`. Specifically, it is not uncommon to have\n`T? x;` and want to assert that `x` has been set to a valid value of type `T`.\nA common mistake is to do so using `x!`. This is almost always incorrect, since\nif `T` is a nullable type, `x` may validly hold `null` as a value of type `T`.\n\n**BAD:**\n```dart\nT run<T>(T callback()) {\n  T? result;\n  (() { result = callback(); })();\n  return result!;\n}\n```\n\n**GOOD:**\n```dart\nT run<T>(T callback()) {\n  T? result;\n  (() { result = callback(); })();\n  return result as T;\n}\n```",
    "sinceDartSdk": "2.12"
  },
  {
    "name": "null_closures",
    "description": "Do not pass `null` as an argument where a closure is expected.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** pass `null` as an argument where a closure is expected.\n\nOften a closure that is passed to a method will only be called conditionally,\nso that tests and \"happy path\" production calls do not reveal that `null` will\nresult in an exception being thrown.\n\nThis rule only catches null literals being passed where closures are expected\nin the following locations:\n\n#### Constructors\n\n* From `dart:async`\n  * `Future` at the 0th positional parameter\n  * `Future.microtask` at the 0th positional parameter\n  * `Future.sync` at the 0th positional parameter\n  * `Timer` at the 0th positional parameter\n  * `Timer.periodic` at the 1st positional parameter\n* From `dart:core`\n  * `List.generate` at the 1st positional parameter\n\n#### Static functions\n\n* From `dart:async`\n  * `scheduleMicrotask` at the 0th positional parameter\n  * `Future.doWhile` at the 0th positional parameter\n  * `Future.forEach` at the 0th positional parameter\n  * `Future.wait` at the named parameter `cleanup`\n  * `Timer.run` at the 0th positional parameter\n\n#### Instance methods\n\n* From `dart:async`\n  * `Future.then` at the 0th positional parameter\n  * `Future.complete` at the 0th positional parameter\n* From `dart:collection`\n  * `Queue.removeWhere` at the 0th positional parameter\n  * `Queue.retain\n  * `Iterable.firstWhere` at the 0th positional parameter, and the named\n    parameter `orElse`\n  * `Iterable.forEach` at the 0th positional parameter\n  * `Iterable.fold` at the 1st positional parameter\n  * `Iterable.lastWhere` at the 0th positional parameter, and the named\n    parameter `orElse`\n  * `Iterable.map` at the 0th positional parameter\n  * `Iterable.reduce` at the 0th positional parameter\n  * `Iterable.singleWhere` at the 0th positional parameter, and the named\n    parameter `orElse`\n  * `Iterable.skipWhile` at the 0th positional parameter\n  * `Iterable.takeWhile` at the 0th positional parameter\n  * `Iterable.where` at the 0th positional parameter\n  * `List.removeWhere` at the 0th positional parameter\n  * `List.retainWhere` at the 0th positional parameter\n  * `String.replaceAllMapped` at the 1st positional parameter\n  * `String.replaceFirstMapped` at the 1st positional parameter\n  * `String.splitMapJoin` at the named parameters `onMatch` and `onNonMatch`\n\n**BAD:**\n```dart\n[1, 3, 5].firstWhere((e) => e.isOdd, orElse: null);\n```\n\n**GOOD:**\n```dart\n[1, 3, 5].firstWhere((e) => e.isOdd, orElse: () => null);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "omit_local_variable_types",
    "description": "Omit type annotations for local variables.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "always_specify_types",
      "specify_nonobvious_local_variable_types"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DON'T** redundantly type annotate initialized local variables.\n\nLocal variables, especially in modern code where functions tend to be small,\nhave very little scope. Omitting the type focuses the reader's attention on the\nmore important *name* of the variable and its initialized value.\n\n**BAD:**\n```dart\nList<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {\n  List<List<Ingredient>> desserts = <List<Ingredient>>[];\n  for (final List<Ingredient> recipe in cookbook) {\n    if (pantry.containsAll(recipe)) {\n      desserts.add(recipe);\n    }\n  }\n\n  return desserts;\n}\n```\n\n**GOOD:**\n```dart\nList<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {\n  var desserts = <List<Ingredient>>[];\n  for (final recipe in cookbook) {\n    if (pantry.containsAll(recipe)) {\n      desserts.add(recipe);\n    }\n  }\n\n  return desserts;\n}\n```\n\nSometimes the inferred type is not the type you want the variable to have. For\nexample, you may intend to assign values of other types later. In that case,\nannotate the variable with the type you want.\n\n**GOOD:**\n```dart\nWidget build(BuildContext context) {\n  Widget result = Text('You won!');\n  if (applyPadding) {\n    result = Padding(padding: EdgeInsets.all(8.0), child: result);\n  }\n  return result;\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "omit_obvious_local_variable_types",
    "description": "Omit obvious type annotations for local variables.",
    "categories": [
      "style"
    ],
    "state": "experimental",
    "incompatible": [
      "always_specify_types"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Don't type annotate initialized local variables when the type is obvious.\n\nLocal variables, especially in modern code where functions tend to be small,\nhave very little scope. Omitting the type focuses the reader's attention on the\nmore important *name* of the variable and its initialized value. Hence, local\nvariable type annotations that are obvious should be omitted.\n\n**BAD:**\n```dart\nList<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {\n  List<List<Ingredient>> desserts = <List<Ingredient>>[];\n  for (final List<Ingredient> recipe in cookbook) {\n    if (pantry.containsAll(recipe)) {\n      desserts.add(recipe);\n    }\n  }\n\n  return desserts;\n}\n\nconst cookbook = <List<Ingredient>>[....];\n```\n\n**GOOD:**\n```dart\nList<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {\n  var desserts = <List<Ingredient>>[];\n  for (final List<Ingredient> recipe in cookbook) {\n    if (pantry.containsAll(recipe)) {\n      desserts.add(recipe);\n    }\n  }\n\n  return desserts;\n}\n\nconst cookbook = <List<Ingredient>>[....];\n```\n\nSometimes the inferred type is not the type you want the variable to have. For\nexample, you may intend to assign values of other types later. You may also\nwish to write a type annotation explicitly because the type of the initializing\nexpression is non-obvious and it will be helpful for future readers of the\ncode to document this type. Or you may wish to commit to a specific type such\nthat future updates of dependencies (in nearby code, in imports, anywhere)\nwill not silently change the type of that variable, thus introducing\ncompile-time errors or run-time bugs in locations where this variable is used.\nIn those cases, go ahead and annotate the variable with the type you want.\n\n**GOOD:**\n```dart\nWidget build(BuildContext context) {\n  Widget result = someGenericFunction(42) ?? Text('You won!');\n  if (applyPadding) {\n    result = Padding(padding: EdgeInsets.all(8.0), child: result);\n  }\n  return result;\n}\n```\n\n**This rule is experimental.** It is being evaluated, and it may be changed\nor removed. Feedback on its behavior is welcome! The main issue is here:\nhttps://github.com/dart-lang/linter/issues/3480.",
    "sinceDartSdk": "3.6-wip"
  },
  {
    "name": "one_member_abstracts",
    "description": "Avoid defining a one-member abstract class when a simple function will do.",
    "categories": [
      "effectiveDart",
      "languageFeatureUsage",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#avoid-defining-a-one-member-abstract-class-when-a-simple-function-will-do):\n\n**AVOID** defining a one-member abstract class when a simple function will do.\n\nUnlike Java, Dart has first-class functions, closures, and a nice light syntax\nfor using them.  If all you need is something like a callback, just use a\nfunction.  If you're defining a class and it only has a single abstract member\nwith a meaningless name like `call` or `invoke`, there is a good chance\nyou just want a function.\n\n**BAD:**\n```dart\nabstract class Predicate {\n  bool test(item);\n}\n```\n\n**GOOD:**\n```dart\ntypedef Predicate = bool Function(item);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "only_throw_errors",
    "description": "Only throw instances of classes extending either Exception or Error.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** throw only instances of classes that extend `dart.core.Error` or\n`dart.core.Exception`.\n\nThrowing instances that do not extend `Error` or `Exception` is a bad practice;\ndoing this is usually a hack for something that should be implemented more\nthoroughly.\n\n**BAD:**\n```dart\nvoid throwString() {\n  throw 'hello world!'; // LINT\n}\n```\n\n**GOOD:**\n```dart\nvoid throwArgumentError() {\n  Error error = ArgumentError('oh!');\n  throw error; // OK\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "overridden_fields",
    "description": "Don't override fields.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DON'T** override fields.\n\nOverriding fields is almost always done unintentionally.  Regardless, it is a\nbad practice to do so.\n\n**BAD:**\n```dart\nclass Base {\n  Object field = 'lorem';\n\n  Object something = 'change';\n}\n\nclass Bad1 extends Base {\n  @override\n  final field = 'ipsum'; // LINT\n}\n\nclass Bad2 extends Base {\n  @override\n  Object something = 'done'; // LINT\n}\n```\n\n**GOOD:**\n```dart\nclass Base {\n  Object field = 'lorem';\n\n  Object something = 'change';\n}\n\nclass Ok extends Base {\n  Object newField; // OK\n\n  final Object newFinal = 'ignore'; // OK\n}\n```\n\n**GOOD:**\n```dart\nabstract class BaseLoggingHandler {\n  Base transformer;\n}\n\nclass LogPrintHandler implements BaseLoggingHandler {\n  @override\n  Derived transformer; // OK\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "package_api_docs",
    "description": "Provide doc comments for all public APIs.",
    "categories": [
      "effectiveDart",
      "publicInterface"
    ],
    "state": "deprecated",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**NOTE:** This lint is deprecated because it is has not\nbeen fully functional since at least Dart 2.0.\nRemove all inclusions of this lint from your analysis options.\n\n**DO** provide doc comments for all public APIs.\n\nAs described in the [pub package layout doc](https://dart.dev/tools/pub/package-layout#implementation-files),\npublic APIs consist in everything in your package's `lib` folder, minus\nimplementation files in `lib/src`, adding elements explicitly exported with an\n`export` directive.\n\nFor example, given `lib/foo.dart`:\n```dart\nexport 'src/bar.dart' show Bar;\nexport 'src/baz.dart';\n\nclass Foo { }\n\nclass _Foo { }\n```\nits API includes:\n\n* `Foo` (but not `_Foo`)\n* `Bar` (exported) and\n* all *public* elements in `src/baz.dart`\n\nAll public API members should be documented with `///` doc-style comments.\n\n**BAD:**\n```dart\nclass Bar {\n  void bar();\n}\n```\n\n**GOOD:**\n```dart\n/// A Foo.\nabstract class Foo {\n  /// Start foo-ing.\n  void start() => _start();\n\n  _start();\n}\n```\n\nAdvice for writing good doc comments can be found in the\n[Doc Writing Guidelines](https://dart.dev/effective-dart/documentation).",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "package_names",
    "description": "Use `lowercase_with_underscores` for package names.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "From the [Pubspec format description](https://dart.dev/tools/pub/pubspec):\n\n**DO** use `lowercase_with_underscores` for package names.\n\nPackage names should be all lowercase, with underscores to separate words,\n`just_like_this`.  Use only basic Latin letters and Arabic digits: \\[a-z0-9\\_\\].\nAlso, make sure the name is a valid Dart identifier -- that it doesn't start\nwith digits and isn't a reserved word.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "package_prefixed_library_names",
    "description": "Prefix library names with the package name and a dot-separated path.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** prefix library names with the package name and a dot-separated path.\n\nThis guideline helps avoid the warnings you get when two libraries have the same\nname.  Here are the rules we recommend:\n\n* Prefix all library names with the package name.\n* Make the entry library have the same name as the package.\n* For all other libraries in a package, after the package name add the\ndot-separated path to the library's Dart file.\n* For libraries under `lib`, omit the top directory name.\n\nFor example, say the package name is `my_package`.  Here are the library names\nfor various files in the package:\n\n**GOOD:**\n```dart\n// In lib/my_package.dart\nlibrary my_package;\n\n// In lib/other.dart\nlibrary my_package.other;\n\n// In lib/foo/bar.dart\nlibrary my_package.foo.bar;\n\n// In example/foo/bar.dart\nlibrary my_package.example.foo.bar;\n\n// In lib/src/private.dart\nlibrary my_package.src.private;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "parameter_assignments",
    "description": "Don't reassign references to parameters of functions or methods.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DON'T** assign new values to parameters of methods or functions.\n\nAssigning new values to parameters is generally a bad practice unless an\noperator such as `??=` is used.  Otherwise, arbitrarily reassigning parameters\nis usually a mistake.\n\n**BAD:**\n```dart\nvoid badFunction(int parameter) { // LINT\n  parameter = 4;\n}\n```\n\n**BAD:**\n```dart\nvoid badFunction(int required, {int optional: 42}) { // LINT\n  optional ??= 8;\n}\n```\n\n**BAD:**\n```dart\nvoid badFunctionPositional(int required, [int optional = 42]) { // LINT\n  optional ??= 8;\n}\n```\n\n**BAD:**\n```dart\nclass A {\n  void badMethod(int parameter) { // LINT\n    parameter = 4;\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid ok(String parameter) {\n  print(parameter);\n}\n```\n\n**GOOD:**\n```dart\nvoid actuallyGood(int required, {int optional}) { // OK\n  optional ??= ...;\n}\n```\n\n**GOOD:**\n```dart\nvoid actuallyGoodPositional(int required, [int optional]) { // OK\n  optional ??= ...;\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  void ok(String parameter) {\n    print(parameter);\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_adjacent_string_concatenation",
    "description": "Use adjacent strings to concatenate string literals.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** use adjacent strings to concatenate string literals.\n\n**BAD:**\n```dart\nraiseAlarm(\n    'ERROR: Parts of the spaceship are on fire. Other ' +\n    'parts are overrun by martians. Unclear which are which.');\n```\n\n**GOOD:**\n```dart\nraiseAlarm(\n    'ERROR: Parts of the spaceship are on fire. Other '\n    'parts are overrun by martians. Unclear which are which.');\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_asserts_in_initializer_lists",
    "description": "Prefer putting asserts in initializer lists.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** put asserts in initializer lists.\n\n**BAD:**\n```dart\nclass A {\n  A(int a) {\n    assert(a != 0);\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  A(int a) : assert(a != 0);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_asserts_with_message",
    "description": "Prefer asserts with message.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "When assertions fail it's not always simple to understand why. Adding a message\nto the `assert` helps the developer to understand why the AssertionError occurs.\n\n**BAD:**\n```dart\nf(a) {\n  assert(a != null);\n}\n\nclass A {\n  A(a) : assert(a != null);\n}\n```\n\n**GOOD:**\n```dart\nf(a) {\n  assert(a != null, 'a must not be null');\n}\n\nclass A {\n  A(a) : assert(a != null, 'a must not be null');\n}\n```",
    "sinceDartSdk": "2.3"
  },
  {
    "name": "prefer_bool_in_asserts",
    "description": "Prefer using a boolean as the assert condition.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.0.0; it is no longer functional.\n\n**DO** use a boolean for assert conditions.\n\nNot using booleans in assert conditions can lead to code where it isn't clear\nwhat the intention of the assert statement is.\n\n**BAD:**\n```dart\nassert(() {\n  f();\n  return true;\n});\n```\n\n**GOOD:**\n```dart\nassert(() {\n  f();\n  return true;\n}());\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_collection_literals",
    "description": "Use collection literals when possible.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** use collection literals when possible.\n\n**BAD:**\n```dart\nvar addresses = Map<String, String>();\nvar uniqueNames = Set<String>();\nvar ids = LinkedHashSet<int>();\nvar coordinates = LinkedHashMap<int, int>();\n```\n\n**GOOD:**\n```dart\nvar addresses = <String, String>{};\nvar uniqueNames = <String>{};\nvar ids = <int>{};\nvar coordinates = <int, int>{};\n```\n\n**EXCEPTIONS:**\n\nWhen a `LinkedHashSet` or `LinkedHashMap` is expected, a collection literal is\nnot preferred (or allowed).\n\n```dart\nvoid main() {\n  LinkedHashSet<int> linkedHashSet =  LinkedHashSet.from([1, 2, 3]); // OK\n  LinkedHashMap linkedHashMap = LinkedHashMap(); // OK\n\n  printSet(LinkedHashSet<int>()); // LINT\n  printHashSet(LinkedHashSet<int>()); // OK\n\n  printMap(LinkedHashMap<int, int>()); // LINT\n  printHashMap(LinkedHashMap<int, int>()); // OK\n}\n\nvoid printSet(Set<int> ids) => print('$ids!');\nvoid printHashSet(LinkedHashSet<int> ids) => printSet(ids);\nvoid printMap(Map map) => print('$map!');\nvoid printHashMap(LinkedHashMap map) => printMap(map);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_conditional_assignment",
    "description": "Prefer using `??=` over testing for `null`.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** using `??=` over testing for `null`.\n\nAs Dart has the `??=` operator, it is advisable to use it where applicable to\nimprove the brevity of your code.\n\n**BAD:**\n```dart\nString get fullName {\n  if (_fullName == null) {\n    _fullName = getFullUserName(this);\n  }\n  return _fullName;\n}\n```\n\n**GOOD:**\n```dart\nString get fullName {\n  return _fullName ??= getFullUserName(this);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_const_constructors",
    "description": "Prefer `const` with constant constructors.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**PREFER** using `const` for instantiating constant constructors.\n\nIf a constructor can be invoked as const to produce a canonicalized instance,\nit's preferable to do so.\n\n**BAD:**\n```dart\nclass A {\n  const A();\n}\n\nvoid accessA() {\n  A a = new A();\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  const A();\n}\n\nvoid accessA() {\n  A a = const A();\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  final int x;\n\n  const A(this.x);\n}\n\nA foo(int x) => new A(x);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_const_constructors_in_immutables",
    "description": "Prefer declaring `const` constructors on `@immutable` classes.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** declaring `const` constructors on `@immutable` classes.\n\nIf a class is immutable, it is usually a good idea to make its constructor a\n`const` constructor.\n\n**BAD:**\n```dart\n@immutable\nclass A {\n  final a;\n  A(this.a);\n}\n```\n\n**GOOD:**\n```dart\n@immutable\nclass A {\n  final a;\n  const A(this.a);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_const_declarations",
    "description": "Prefer `const` over `final` for declarations.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**PREFER** using `const` for constant-valued declarations.\n\nConstant declarations are more hot-reload friendly and allow\nvalues to be used in other constant expressions.\n\n**BAD:**\n```dart\nfinal o = const <int>[];\n\nclass A {\n  static final o = const <int>[];\n}\n```\n\n**GOOD:**\n```dart\nconst o = <int>[];\n\nclass A {\n  static const o = <int>[];\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_const_literals_to_create_immutables",
    "description": "Prefer const literals as parameters of constructors on @immutable classes.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**PREFER** using `const` for instantiating list, map and set literals used as\nparameters in immutable class instantiations.\n\n**BAD:**\n```dart\n@immutable\nclass A {\n  A(this.v);\n  final v;\n}\n\nA a1 = new A([1]);\nA a2 = new A({});\n```\n\n**GOOD:**\n```dart\nA a1 = new A(const [1]);\nA a2 = new A(const {});\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_constructors_over_static_methods",
    "description": "Prefer defining constructors instead of static methods to create instances.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**PREFER** defining constructors instead of static methods to create instances.\n\nIn most cases, it makes more sense to use a named constructor rather than a\nstatic method because it makes instantiation clearer.\n\n**BAD:**\n```dart\nclass Point {\n  num x, y;\n  Point(this.x, this.y);\n  static Point polar(num theta, num radius) {\n    return Point(radius * math.cos(theta),\n        radius * math.sin(theta));\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Point {\n  num x, y;\n  Point(this.x, this.y);\n  Point.polar(num theta, num radius)\n      : x = radius * math.cos(theta),\n        y = radius * math.sin(theta);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_contains",
    "description": "Use contains for `List` and `String` instances.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** use `indexOf` to see if a collection contains an element.\n\nCalling `indexOf` to see if a collection contains something is difficult to read\nand may have poor performance.\n\nInstead, prefer `contains`.\n\n**BAD:**\n```dart\nif (lunchBox.indexOf('sandwich') == -1) return 'so hungry...';\n```\n\n**GOOD:**\n```dart\nif (!lunchBox.contains('sandwich')) return 'so hungry...';\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_double_quotes",
    "description": "Prefer double quotes where they won't require escape sequences.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "prefer_single_quotes"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use double quotes where they wouldn't require additional escapes.\n\nThat means strings with a double quote may use apostrophes so that the double\nquote isn't escaped (note: we don't lint the other way around, ie, a double\nquoted string with an escaped double quote is not flagged).\n\nIt's also rare, but possible, to have strings within string interpolations.  In\nthis case, it's much more readable to use a single quote somewhere.  So single\nquotes are allowed either within, or containing, an interpolated string literal.\nArguably strings within string interpolations should be its own type of lint.\n\n**BAD:**\n```dart\nuseStrings(\n    'should be double quote',\n    r'should be double quote',\n    r\\'''should be double quotes\\''')\n```\n\n**GOOD:**\n```dart\nuseStrings(\n    \"should be double quote\",\n    r\"should be double quote\",\n    r\"\"\"should be double quotes\"\"\",\n    'ok with \" inside',\n    'nested \\${a ? \"strings\" : \"can\"} be wrapped by a double quote',\n    \"and nested \\${a ? 'strings' : 'can be double quoted themselves'}\");\n```",
    "sinceDartSdk": "2.4"
  },
  {
    "name": "prefer_equal_for_default_values",
    "description": "Use `=` to separate a named parameter from its default value.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.0; it is no longer functional.\n\n**DO** use `=` to separate a named parameter from its default value.\n\n**BAD:**\n```dart\nm({a: 1})\n```\n\n**GOOD:**\n```dart\nm({a = 1})\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_expression_function_bodies",
    "description": "Use => for short members whose body is a single return statement.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**CONSIDER** using => for short members whose body is a single return statement.\n\n**BAD:**\n```dart\nget width {\n  return right - left;\n}\n```\n\n**BAD:**\n```dart\nbool ready(num time) {\n  return minTime == null || minTime <= time;\n}\n```\n\n**BAD:**\n```dart\ncontainsValue(String value) {\n  return getValues().contains(value);\n}\n```\n\n**GOOD:**\n```dart\nget width => right - left;\n```\n\n**GOOD:**\n```dart\nbool ready(num time) => minTime == null || minTime <= time;\n```\n\n**GOOD:**\n```dart\ncontainsValue(String value) => getValues().contains(value);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_final_fields",
    "description": "Private field could be `final`.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#prefer-making-fields-and-top-level-variables-final):\n\n**DO** prefer declaring private fields as `final` if they are not reassigned\nlater in the library.\n\nDeclaring fields as `final` when possible is a good practice because it helps\navoid accidental reassignments and allows the compiler to do optimizations.\n\n**BAD:**\n```dart\nclass BadImmutable {\n  var _label = 'hola mundo! BadImmutable'; // LINT\n  var label = 'hola mundo! BadImmutable'; // OK\n}\n```\n\n**BAD:**\n```dart\nclass MultipleMutable {\n  var _label = 'hola mundo! GoodMutable', _offender = 'mumble mumble!'; // LINT\n  var _someOther; // LINT\n\n  MultipleMutable() : _someOther = 5;\n\n  MultipleMutable(this._someOther);\n\n  void changeLabel() {\n    _label= 'hello world! GoodMutable';\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass GoodImmutable {\n  final label = 'hola mundo! BadImmutable', bla = 5; // OK\n  final _label = 'hola mundo! BadImmutable', _bla = 5; // OK\n}\n```\n\n**GOOD:**\n```dart\nclass GoodMutable {\n  var _label = 'hola mundo! GoodMutable';\n\n  void changeLabel() {\n    _label = 'hello world! GoodMutable';\n  }\n}\n```\n\n**BAD:**\n```dart\nclass AssignedInAllConstructors {\n  var _label; // LINT\n  AssignedInAllConstructors(this._label);\n  AssignedInAllConstructors.withDefault() : _label = 'Hello';\n}\n```\n\n**GOOD:**\n```dart\nclass NotAssignedInAllConstructors {\n  var _label; // OK\n  NotAssignedInAllConstructors();\n  NotAssignedInAllConstructors.withDefault() : _label = 'Hello';\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_final_in_for_each",
    "description": "Prefer final in for-each loop variable if reference is not reassigned.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** prefer declaring for-each loop variables as final if they are not\nreassigned later in the code.\n\nDeclaring for-each loop variables as final when possible is a good practice\nbecause it helps avoid accidental reassignments and allows the compiler to do\noptimizations.\n\n**BAD:**\n```dart\nfor (var element in elements) { // LINT\n  print('Element: $element');\n}\n```\n\n**GOOD:**\n```dart\nfor (final element in elements) {\n  print('Element: $element');\n}\n```\n\n**GOOD:**\n```dart\nfor (var element in elements) {\n  element = element + element;\n  print('Element: $element');\n}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "prefer_final_locals",
    "description": "Prefer final for variable declarations if they are not reassigned.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "unnecessary_final"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** prefer declaring variables as final if they are not reassigned later in\nthe code.\n\nDeclaring variables as final when possible is a good practice because it helps\navoid accidental reassignments and allows the compiler to do optimizations.\n\n**BAD:**\n```dart\nvoid badMethod() {\n  var label = 'hola mundo! badMethod'; // LINT\n  print(label);\n}\n```\n\n**GOOD:**\n```dart\nvoid goodMethod() {\n  final label = 'hola mundo! goodMethod';\n  print(label);\n}\n```\n\n**GOOD:**\n```dart\nvoid mutableCase() {\n  var label = 'hola mundo! mutableCase';\n  print(label);\n  label = 'hello world';\n  print(label);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_final_parameters",
    "description": "Prefer final for parameter declarations if they are not reassigned.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "unnecessary_final",
      "avoid_final_parameters"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** prefer declaring parameters as final if they are not reassigned in\nthe function body.\n\nDeclaring parameters as final when possible is a good practice because it helps\navoid accidental reassignments.\n\n**BAD:**\n```dart\nvoid badParameter(String label) { // LINT\n  print(label);\n}\n```\n\n**GOOD:**\n```dart\nvoid goodParameter(final String label) { // OK\n  print(label);\n}\n```\n\n**BAD:**\n```dart\nvoid badExpression(int value) => print(value); // LINT\n```\n\n**GOOD:**\n```dart\nvoid goodExpression(final int value) => print(value); // OK\n```\n\n**BAD:**\n```dart\n[1, 4, 6, 8].forEach((value) => print(value + 2)); // LINT\n```\n\n**GOOD:**\n```dart\n[1, 4, 6, 8].forEach((final value) => print(value + 2)); // OK\n```\n\n**GOOD:**\n```dart\nvoid mutableParameter(String label) { // OK\n  print(label);\n  label = 'Hello Linter!';\n  print(label);\n}\n```",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "prefer_for_elements_to_map_fromIterable",
    "description": "Prefer `for` elements when building maps from iterables.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "When building maps from iterables, it is preferable to use `for` elements.\n\nUsing 'for' elements brings several benefits including:\n\n- Performance\n- Flexibility\n- Readability\n- Improved type inference\n- Improved interaction with null safety\n\n\n**BAD:**\n```dart\nMap<String, WidgetBuilder>.fromIterable(\n  kAllGalleryDemos,\n  key: (demo) => '${demo.routeName}',\n  value: (demo) => demo.buildRoute,\n);\n```\n\n**GOOD:**\n```dart\nreturn {\n  for (var demo in kAllGalleryDemos)\n    '${demo.routeName}': demo.buildRoute,\n};\n```\n\n**GOOD:**\n```dart\n// Map<int, Student> is not required, type is inferred automatically.\nfinal pizzaRecipients = {\n  ...studentLeaders,\n  for (var student in classG)\n    if (student.isPassing) student.id: student,\n};\n```",
    "sinceDartSdk": "2.3"
  },
  {
    "name": "prefer_foreach",
    "description": "Use `forEach` to only apply a function to all the elements.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** use `forEach` if you are only going to apply a function or a method\nto all the elements of an iterable.\n\nUsing `forEach` when you are only going to apply a function or method to all\nelements of an iterable is a good practice because it makes your code more\nterse.\n\n**BAD:**\n```dart\nfor (final key in map.keys.toList()) {\n  map.remove(key);\n}\n```\n\n**GOOD:**\n```dart\nmap.keys.toList().forEach(map.remove);\n```\n\n**NOTE:** Replacing a for each statement with a forEach call may change the\nbehavior in the case where there are side-effects on the iterable itself.\n```dart\nfor (final v in myList) {\n  foo().f(v); // This code invokes foo() many times.\n}\n\nmyList.forEach(foo().f); // But this one invokes foo() just once.\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_function_declarations_over_variables",
    "description": "Use a function declaration to bind a function to a name.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#do-use-a-function-declaration-to-bind-a-function-to-a-name):\n\n**DO** use a function declaration to bind a function to a name.\n\nAs Dart allows local function declarations, it is a good practice to use them in\nthe place of function literals.\n\n**BAD:**\n```dart\nvoid main() {\n  var localFunction = () {\n    ...\n  };\n}\n```\n\n**GOOD:**\n```dart\nvoid main() {\n  localFunction() {\n    ...\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_generic_function_type_aliases",
    "description": "Prefer generic function type aliases.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** generic function type aliases.\n\nWith the introduction of generic functions, function type aliases\n(`typedef void F()`) couldn't express all of the possible kinds of\nparameterization that users might want to express. Generic function type aliases\n(`typedef F = void Function()`) fixed that issue.\n\nFor consistency and readability reasons, it's better to only use one syntax and\nthus prefer generic function type aliases.\n\n**BAD:**\n```dart\ntypedef void F();\n```\n\n**GOOD:**\n```dart\ntypedef F = void Function();\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_if_elements_to_conditional_expressions",
    "description": "Prefer if elements to conditional expressions where possible.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "When building collections, it is preferable to use `if` elements rather than\nconditionals.\n\n**BAD:**\n```dart\nvar list = ['a', 'b', condition ? 'c' : null].where((e) => e != null).toList();\n```\n\n**GOOD:**\n```dart\nvar list = ['a', 'b', if (condition) 'c'];\n```",
    "sinceDartSdk": "2.3"
  },
  {
    "name": "prefer_if_null_operators",
    "description": "Prefer using `??` operators.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** using `??` operators instead of `null` checks and conditional\nexpressions.\n\n**BAD:**\n```dart\nv = a == null ? b : a;\n```\n\n**GOOD:**\n```dart\nv = a ?? b;\n```",
    "sinceDartSdk": "2.4"
  },
  {
    "name": "prefer_initializing_formals",
    "description": "Use initializing formals when possible.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** use initializing formals when possible.\n\nUsing initializing formals when possible makes your code more terse.\n\n**BAD:**\n```dart\nclass Point {\n  num? x, y;\n  Point(num x, num y) {\n    this.x = x;\n    this.y = y;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Point {\n  num? x, y;\n  Point(num this.x, num this.y);\n}\n```\n\n**BAD:**\n```dart\nclass Point {\n  num? x, y;\n  Point({num? x, num? y}) {\n    this.x = x;\n    this.y = y;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Point {\n  num? x, y;\n  Point({required num this.x, required num this.y});\n}\n```\n\n**NOTE:**\nThis rule will not generate a lint for named parameters unless the parameter\nname and the field name are the same. The reason for this is that resolving\nsuch a lint would require either renaming the field or renaming the parameter,\nand both of those actions would potentially be a breaking change. For example,\nthe following will not generate a lint:\n\n```dart\nclass Point {\n  bool? isEnabled;\n  Point({bool? enabled}) {\n    this.isEnabled = enabled; // OK\n  }\n}\n```\n\n**NOTE:**\nAlso note that it is possible to enforce a type that is stricter than the\ninitialized field with an initializing formal parameter.  In the following\nexample the unnamed `Bid` constructor requires a non-null `int` despite\n`amount` being declared nullable (`int?`).\n\n```dart\nclass Bid {\n  final int? amount;\n  Bid(int this.amount);\n  Bid.pass() : amount = null;\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_inlined_adds",
    "description": "Inline list item declarations where possible.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Declare elements in list literals inline, rather than using `add` and\n`addAll` methods where possible.\n\n\n**BAD:**\n```dart\nvar l = ['a']..add('b')..add('c');\nvar l2 = ['a']..addAll(['b', 'c']);\n```\n\n**GOOD:**\n```dart\nvar l = ['a', 'b', 'c'];\nvar l2 = ['a', 'b', 'c'];\n```",
    "sinceDartSdk": "2.3"
  },
  {
    "name": "prefer_int_literals",
    "description": "Prefer int literals over double literals.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use int literals rather than the corresponding double literal.\n\n**BAD:**\n```dart\nconst double myDouble = 8.0;\nfinal anotherDouble = myDouble + 7.0e2;\nmain() {\n  someMethod(6.0);\n}\n```\n\n**GOOD:**\n```dart\nconst double myDouble = 8;\nfinal anotherDouble = myDouble + 700;\nmain() {\n  someMethod(6);\n}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "prefer_interpolation_to_compose_strings",
    "description": "Use interpolation to compose strings and values.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** using interpolation to compose strings and values.\n\nUsing interpolation when composing strings and values is usually easier to write\nand read than concatenation.\n\n**BAD:**\n```dart\n'Hello, ' + person.name + ' from ' + person.city + '.';\n```\n\n**GOOD:**\n```dart\n'Hello, ${person.name} from ${person.city}.'\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_is_empty",
    "description": "Use `isEmpty` for `Iterable`s and `Map`s.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** use `length` to see if a collection is empty.\n\nThe `Iterable` contract does not require that a collection know its length or be\nable to provide it in constant time.  Calling `length` just to see if the\ncollection contains anything can be painfully slow.\n\nInstead, there are faster and more readable getters: `isEmpty` and\n`isNotEmpty`.  Use the one that doesn't require you to negate the result.\n\n**BAD:**\n```dart\nif (lunchBox.length == 0) return 'so hungry...';\nif (words.length != 0) return words.join(' ');\n```\n\n**GOOD:**\n```dart\nif (lunchBox.isEmpty) return 'so hungry...';\nif (words.isNotEmpty) return words.join(' ');\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_is_not_empty",
    "description": "Use `isNotEmpty` for `Iterable`s and `Map`s.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** `x.isNotEmpty` to `!x.isEmpty` for `Iterable` and `Map` instances.\n\nWhen testing whether an iterable or map is empty, prefer `isNotEmpty` over\n`!isEmpty` to improve code readability.\n\n**BAD:**\n```dart\nif (!sources.isEmpty) {\n  process(sources);\n}\n```\n\n**GOOD:**\n```dart\nif (todo.isNotEmpty) {\n  sendResults(request, todo.isEmpty);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_is_not_operator",
    "description": "Prefer is! operator.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "When checking if an object is not of a specified type, it is preferable to use the 'is!' operator.\n\n**BAD:**\n```dart\nif (!(foo is Foo)) {\n  ...\n}\n```\n\n**GOOD:**\n```dart\nif (foo is! Foo) {\n  ...\n}\n```",
    "sinceDartSdk": "2.7"
  },
  {
    "name": "prefer_iterable_whereType",
    "description": "Prefer to use `whereType` on iterable.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** `iterable.whereType<T>()` over `iterable.where((e) => e is T)`.\n\n**BAD:**\n```dart\niterable.where((e) => e is MyClass);\n```\n\n**GOOD:**\n```dart\niterable.whereType<MyClass>();\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_mixin",
    "description": "Prefer using mixins.",
    "categories": [
      "languageFeatureUsage",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Dart 2.1 introduced a new syntax for mixins that provides a safe way for a mixin\nto invoke inherited members using `super`. The new style of mixins should always\nbe used for types that are to be mixed in. As a result, this lint will flag any\nuses of a class in a `with` clause.\n\n**BAD:**\n```dart\nclass A {}\nclass B extends Object with A {}\n```\n\n**OK:**\n```dart\nmixin M {}\nclass C with M {}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "prefer_null_aware_method_calls",
    "description": "Prefer `null`-aware method calls.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Instead of checking nullability of a function/method `f` before calling it,\nyou can use `f?.call()`.\n\n**BAD:**\n```dart\nif (f != null) f!();\n```\n\n**GOOD:**\n```dart\nf?.call();\n```",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "prefer_null_aware_operators",
    "description": "Prefer using `null`-aware operators.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** using `null`-aware operators instead of `null` checks in conditional\nexpressions.\n\n**BAD:**\n```dart\nv = a == null ? null : a.b;\n```\n\n**GOOD:**\n```dart\nv = a?.b;\n```",
    "sinceDartSdk": "2.2"
  },
  {
    "name": "prefer_relative_imports",
    "description": "Prefer relative imports for files in `lib/`.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [
      "always_use_package_imports"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**PREFER** relative imports for files in `lib/`.\n\nWhen mixing relative and absolute imports it's possible to create confusion\nwhere the same member gets imported in two different ways. One way to avoid\nthat is to ensure you consistently use relative imports for files within the\n`lib/` directory.\n\n**BAD:**\n```dart\nimport 'package:my_package/bar.dart';\n```\n\n**GOOD:**\n```dart\nimport 'bar.dart';\n```",
    "sinceDartSdk": "2.6"
  },
  {
    "name": "prefer_single_quotes",
    "description": "Only use double quotes for strings containing single quotes.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "prefer_double_quotes"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use single quotes where they wouldn't require additional escapes.\n\nThat means strings with an apostrophe may use double quotes so that the\napostrophe isn't escaped (note: we don't lint the other way around, ie, a single\nquoted string with an escaped apostrophe is not flagged).\n\nIt's also rare, but possible, to have strings within string interpolations.  In\nthis case, it's much more readable to use a double quote somewhere.  So double\nquotes are allowed either within, or containing, an interpolated string literal.\nArguably strings within string interpolations should be its own type of lint.\n\n**BAD:**\n```dart\nuseStrings(\n    \"should be single quote\",\n    r\"should be single quote\",\n    r\"\"\"should be single quotes\"\"\")\n```\n\n**GOOD:**\n```dart\nuseStrings(\n    'should be single quote',\n    r'should be single quote',\n    r\\'''should be single quotes\\''',\n    \"here's ok\",\n    \"nested \\${a ? 'strings' : 'can'} be wrapped by a double quote\",\n    'and nested \\${a ? \"strings\" : \"can be double quoted themselves\"}');\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_spread_collections",
    "description": "Use spread collections when possible.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Use spread collections when possible.\n\nCollection literals are excellent when you want to create a new collection out\nof individual items. But, when existing items are already stored in another\ncollection, spread collection syntax leads to simpler code.\n\n**BAD:**\n\n```dart\nWidget build(BuildContext context) {\n  return CupertinoPageScaffold(\n    child: ListView(\n      children: [\n        Tab2Header(),\n      ]..addAll(buildTab2Conversation()),\n    ),\n  );\n}\n```\n\n```dart\nvar ints = [1, 2, 3];\nprint(['a']..addAll(ints.map((i) => i.toString()))..addAll(['c']));\n```\n\n```dart\nvar things;\nvar l = ['a']..addAll(things ?? const []);\n```\n\n\n**GOOD:**\n\n```dart\nWidget build(BuildContext context) {\n  return CupertinoPageScaffold(\n    child: ListView(\n      children: [\n        Tab2Header(),\n        ...buildTab2Conversation(),\n      ],\n    ),\n  );\n}\n```\n\n```dart\nvar ints = [1, 2, 3];\nprint(['a', ...ints.map((i) => i.toString()), 'c');\n```\n\n```dart\nvar things;\nvar l = ['a', ...?things];\n```",
    "sinceDartSdk": "2.3"
  },
  {
    "name": "prefer_typing_uninitialized_variables",
    "description": "Prefer typing uninitialized variables and fields.",
    "categories": [
      "errorProne",
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** specifying a type annotation for uninitialized variables and fields.\n\nForgoing type annotations for uninitialized variables is a bad practice because\nyou may accidentally assign them to a type that you didn't originally intend to.\n\n**BAD:**\n```dart\nclass BadClass {\n  static var bar; // LINT\n  var foo; // LINT\n\n  void method() {\n    var bar; // LINT\n    bar = 5;\n    print(bar);\n  }\n}\n```\n\n**BAD:**\n```dart\nvoid aFunction() {\n  var bar; // LINT\n  bar = 5;\n  ...\n}\n```\n\n**GOOD:**\n```dart\nclass GoodClass {\n  static var bar = 7;\n  var foo = 42;\n  int baz; // OK\n\n  void method() {\n    int baz;\n    var bar = 5;\n    ...\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "prefer_void_to_null",
    "description": "Don't use the Null type, unless you are positive that you don't want void.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DON'T** use the type Null where void would work.\n\n**BAD:**\n```dart\nNull f() {}\nFuture<Null> f() {}\nStream<Null> f() {}\nf(Null x) {}\n```\n\n**GOOD:**\n```dart\nvoid f() {}\nFuture<void> f() {}\nStream<void> f() {}\nf(void x) {}\n```\n\nSome exceptions include formulating special function types:\n\n```dart\nNull Function(Null, Null);\n```\n\nand for making empty literals which are safe to pass into read-only locations\nfor any type of map or list:\n\n```dart\n<Null>[];\n<int, Null>{};\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "provide_deprecation_message",
    "description": "Provide a deprecation message, via `@Deprecated(\"message\")`.",
    "categories": [
      "publicInterface"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DO** specify a deprecation message (with migration instructions and/or a\nremoval schedule) in the `Deprecated` constructor.\n\n**BAD:**\n```dart\n@deprecated\nvoid oldFunction(arg1, arg2) {}\n```\n\n**GOOD:**\n```dart\n@Deprecated(\"\"\"\n[oldFunction] is being deprecated in favor of [newFunction] (with slightly\ndifferent parameters; see [newFunction] for more information). [oldFunction]\nwill be removed on or after the 4.0.0 release.\n\"\"\")\nvoid oldFunction(arg1, arg2) {}\n```",
    "sinceDartSdk": "2.2"
  },
  {
    "name": "public_member_api_docs",
    "description": "Document all public members.",
    "categories": [
      "publicInterface",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** document all public members.\n\nAll non-overriding public members should be documented with `///` doc-style\ncomments.\n\n**BAD:**\n```dart\nclass Bad {\n  void meh() { }\n}\n```\n\n**GOOD:**\n```dart\n/// A good thing.\nabstract class Good {\n  /// Start doing your thing.\n  void start() => _start();\n\n  _start();\n}\n```\n\nIn case a public member overrides a member it is up to the declaring member\nto provide documentation.  For example, in the following, `Sub` needn't\ndocument `init` (though it certainly may, if there's need).\n\n**GOOD:**\n```dart\n/// Base of all things.\nabstract class Base {\n  /// Initialize the base.\n  void init();\n}\n\n/// A sub base.\nclass Sub extends Base {\n  @override\n  void init() { ... }\n}\n```\n\nNote that consistent with `dart doc`, an exception to the rule is made when\ndocumented getters have corresponding undocumented setters.  In this case the\nsetters inherit the docs from the getters.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "recursive_getters",
    "description": "Property getter recursively returns itself.",
    "categories": [
      "errorProne",
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DON'T** create recursive getters.\n\nRecursive getters are getters which return themselves as a value.  This is\nusually a typo.\n\n**BAD:**\n```dart\nint get field => field; // LINT\n```\n\n**BAD:**\n```dart\nint get otherField {\n  return otherField; // LINT\n}\n```\n\n**GOOD:**\n```dart\nint get field => _field;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "require_trailing_commas",
    "description": "Use trailing commas for all parameter lists and argument lists.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use trailing commas for all multi-line parameter lists and argument\nlists. A parameter list or argument list that fits on one line, including the\nopening parenthesis and closing parenthesis, does not require a trailing comma.\n\n**BAD:**\n```dart\nvoid run() {\n  method('does not fit on one line',\n      'test test test test test test test test test test test');\n}\n```\n\n**GOOD:**\n```dart\nvoid run() {\n  method(\n    'does not fit on one line',\n    'test test test test test test test test test test test',\n  );\n}\n```\n\n**EXCEPTION:** If the final argument in an argument list is positional (vs\nnamed) and is either a function literal with curly braces, a map literal, a set\nliteral, or a list literal, then a trailing comma is not required.\nThis exception only applies if the final argument does not fit entirely on one\nline.\n\n**NOTE:** This lint rule assumes that code has been formatted with `dart format`\nand may produce false positives on unformatted code.",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "secure_pubspec_urls",
    "description": "Use secure urls in `pubspec.yaml`.",
    "categories": [
      "pub"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DO** Use secure urls in `pubspec.yaml`.\n\nUse `https` instead of `http` or `git:`.\n\n**BAD:**\n```yaml\nrepository: http://github.com/dart-lang/example\n```\n\n```yaml\ngit:\n  url: git://github.com/dart-lang/example/example.git\n```\n\n**GOOD:**\n```yaml\nrepository: https://github.com/dart-lang/example\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "sized_box_for_whitespace",
    "description": "`SizedBox` for whitespace.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Use `SizedBox` to add whitespace to a layout.\n\nA `Container` is a heavier Widget than a `SizedBox`, and as bonus, `SizedBox`\nhas a `const` constructor.\n\n**BAD:**\n```dart\nWidget buildRow() {\n  return Row(\n    children: <Widget>[\n      const MyLogo(),\n      Container(width: 4),\n      const Expanded(\n        child: Text('...'),\n      ),\n    ],\n  );\n}\n```\n\n**GOOD:**\n```dart\nWidget buildRow() {\n  return Row(\n    children: const <Widget>[\n      MyLogo(),\n      SizedBox(width: 4),\n      Expanded(\n        child: Text('...'),\n      ),\n    ],\n  );\n}\n```",
    "sinceDartSdk": "2.9"
  },
  {
    "name": "sized_box_shrink_expand",
    "description": "Use SizedBox shrink and expand named constructors.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Use `SizedBox.shrink(...)` and `SizedBox.expand(...)` constructors\nappropriately.\n\nEither the `SizedBox.shrink(...)` or `SizedBox.expand(...)` constructor should\nbe used instead of the more general `SizedBox(...)` constructor when one of the\nnamed constructors capture the intent of the code more succinctly.\n\n**Examples**\n\n**BAD:**\n```dart\nWidget buildLogo() {\n  return SizedBox(\n    height: 0,\n    width: 0,\n    child: const MyLogo(),\n  );\n}\n```\n\n```dart\nWidget buildLogo() {\n  return SizedBox(\n    height: double.infinity,\n    width: double.infinity,\n    child: const MyLogo(),\n  );\n}\n```\n\n**GOOD:**\n```dart\nWidget buildLogo() {\n  return SizedBox.shrink(\n    child: const MyLogo(),\n  );\n}\n```\n\n```dart\nWidget buildLogo() {\n  return SizedBox.expand(\n    child: const MyLogo(),\n  );\n}\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "slash_for_doc_comments",
    "description": "Prefer using `///` for doc comments.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/documentation#do-use--doc-comments-to-document-members-and-types):\n\n**DO** use `///` for documentation comments.\n\nAlthough Dart supports two syntaxes of doc comments (`///` and `/**`), we\nprefer using `///` for doc comments.\n\n**GOOD:**\n```dart\n/// Parses a set of option strings. For each option:\n///\n/// * If it is `null`, then it is ignored.\n/// * If it is a string, then [validate] is called on it.\n/// * If it is any other type, it is *not* validated.\nvoid parse(List options) {\n  // ...\n}\n```\n\nWithin a doc comment, you can use markdown for formatting.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "sort_child_properties_last",
    "description": "Sort child properties last in widget instance creations.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Sort child properties last in widget instance creations.  This improves\nreadability and plays nicest with UI as Code visualization in IDEs with UI as\nCode Guides in editors (such as IntelliJ) where Properties in the correct order\nappear clearly associated with the constructor call and separated from the\nchildren.\n\n**BAD:**\n```dart\nreturn Scaffold(\n  appBar: AppBar(\n    title: Text(widget.title),\n  ),\n  body: Center(\n    child: Column(\n      children: <Widget>[\n        Text(\n          'You have pushed the button this many times:',\n         ),\n        Text(\n          '$_counter',\n          style: Theme.of(context).textTheme.display1,\n         ),\n      ],\n      mainAxisAlignment: MainAxisAlignment.center,\n    ),\n    widthFactor: 0.5,\n  ),\n  floatingActionButton: FloatingActionButton(\n    child: Icon(Icons.add),\n    onPressed: _incrementCounter,\n    tooltip: 'Increment',\n  ),\n);\n```\n\n**GOOD:**\n```dart\nreturn Scaffold(\n  appBar: AppBar(\n    title: Text(widget.title),\n  ),\n  body: Center(\n    widthFactor: 0.5,\n    child: Column(\n      mainAxisAlignment: MainAxisAlignment.center,\n      children: <Widget>[\n        Text(\n          'You have pushed the button this many times:',\n         ),\n        Text(\n          '$_counter',\n          style: Theme.of(context).textTheme.display1,\n         ),\n      ],\n    ),\n  ),\n  floatingActionButton: FloatingActionButton(\n    onPressed: _incrementCounter,\n    tooltip: 'Increment',\n    child: Icon(Icons.add),\n  ),\n);\n```\n\nException: It's allowed to have parameter with a function expression after the\n`child` property.",
    "sinceDartSdk": "2.4"
  },
  {
    "name": "sort_constructors_first",
    "description": "Sort constructor declarations before other members.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** sort constructor declarations before other members.\n\n**BAD:**\n```dart\nabstract class Visitor {\n  double value;\n  visitSomething(Something s);\n  Visitor();\n}\n```\n\n**GOOD:**\n```dart\nabstract class Animation<T> {\n  const Animation(this.value);\n  double value;\n  void addListener(VoidCallback listener);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "sort_pub_dependencies",
    "description": "Sort pub dependencies alphabetically.",
    "categories": [
      "pub"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** sort pub dependencies alphabetically (A to Z) in `pubspec.yaml`.\n\nSorting list of pub dependencies makes maintenance easier.",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "sort_unnamed_constructors_first",
    "description": "Sort unnamed constructor declarations first.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** sort unnamed constructor declarations first, before named ones.\n\n**BAD:**\n```dart\nclass _PriorityItem {\n  factory _PriorityItem.forName(bool isStatic, String name, _MemberKind kind) => ...\n  _PriorityItem(this.isStatic, this.kind, this.isPrivate);\n  ...\n}\n```\n\n**GOOD:**\n```dart\nabstract class CancelableFuture<T> implements Future<T>  {\n  factory CancelableFuture(computation()) => ...\n  factory CancelableFuture.delayed(Duration duration, [computation()]) => ...\n  ...\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "specify_nonobvious_local_variable_types",
    "description": "Specify non-obvious type annotations for local variables.",
    "categories": [
      "style"
    ],
    "state": "experimental",
    "incompatible": [
      "omit_local_variable_types"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Do type annotate initialized local variables when the type is non-obvious.\n\nType annotations on local variables can serve as a request for type inference,\ndocumenting the expected outcome of the type inference step, and declaratively\nallowing the compiler and analyzer to solve the possibly complex task of\nfinding type arguments and annotations in the initializing expression that\nyield the desired result.\n\nType annotations on local variables can also inform readers about the type\nof the initializing expression, which will allow them to proceed reading the\nsubsequent lines of code with known good information about the type of the\ngiven variable (which may not be immediately evident by looking at the\ninitializing expression).\n\nAn expression is considered to have a non-obvious type when it does not\nhave an obvious type.\n\nAn expression e has an obvious type in the following cases:\n\n- e is a non-collection literal. For instance, 1, true, 'Hello, $name!'.\n- e is a collection literal with actual type arguments. For instance,\n  <int, bool>{}.\n- e is a list literal or a set literal where at least one element has an\n  obvious type, and all elements have the same type. For instance, [1, 2] and\n  { [true, false], [] }, but not [1, 1.5].\n- e is a map literal where all key-value pair have a key with an obvious type\n  and a value with an obvious type, and all keys have the same type, and all\n  values have the same type. For instance, { #a: <int>[] }, but not\n  {1: 1, 2: true}.\n- e is an instance creation expression whose class part is not raw. For\n  instance C(14) if C is a non-generic class, or C<int>(14) if C accepts one\n  type argument, but not C(14) if C accepts one or more type arguments.\n- e is a cascade whose target has an obvious type. For instance,\n  1..isEven..isEven has an obvious type because 1 has an obvious type.\n- e is a type cast. For instance, myComplexExpression as int.\n\n**BAD:**\n```dart\nList<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {\n  var desserts = genericFunctionDeclaredFarAway(<num>[42], 'Something');\n  for (final recipe in cookbook) {\n    if (pantry.containsAll(recipe)) {\n      desserts.add(recipe);\n    }\n  }\n\n  return desserts;\n}\n\nconst List<List<Ingredient>> cookbook = ...;\n```\n\n**GOOD:**\n```dart\nList<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {\n  List<List<Ingredient>> desserts = genericFunctionDeclaredFarAway(\n    <num>[42],\n    'Something',\n  );\n  for (final List<Ingredient> recipe in cookbook) {\n    if (pantry.containsAll(recipe)) {\n      desserts.add(recipe);\n    }\n  }\n\n  return desserts;\n}\n\nconst List<List<Ingredient>> cookbook = ...;\n```\n\n**This rule is experimental.** It is being evaluated, and it may be changed\nor removed. Feedback on its behavior is welcome! The main issue is here:\nhttps://github.com/dart-lang/linter/issues/3480.",
    "sinceDartSdk": "3.6-wip"
  },
  {
    "name": "super_goes_last",
    "description": "Place the `super` call last in a constructor initialization list.",
    "categories": [],
    "state": "removed",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "NOTE: This rule is removed in Dart 3.0.0; it is no longer functional.\n\n**DO** place the `super` call last in a constructor initialization list.\n\nField initializers are evaluated in the order that they appear in the\nconstructor initialization list.  If you place a `super()` call in the middle of\nan initializer list, the superclass's initializers will be evaluated right then\nbefore evaluating the rest of the subclass's initializers.\n\nWhat it doesn't mean is that the superclass's constructor body will be executed\nthen.  That always happens after all initializers are run regardless of where\n`super` appears.  It's vanishingly rare that the order of initializers matters,\nso the placement of `super` in the list almost never matters either.\n\nGetting in the habit of placing it last improves consistency, visually\nreinforces when the superclass's constructor body is run, and may help\nperformance.\n\n**BAD:**\n```dart\nView(Style style, List children)\n    : super(style),\n      _children = children {\n```\n\n**GOOD:**\n```dart\nView(Style style, List children)\n    : _children = children,\n      super(style) {\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "test_types_in_equals",
    "description": "Test type of argument in `operator ==(Object other)`.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** test type of argument in `operator ==(Object other)`.\n\nNot testing the type might result in runtime type errors which will be\nunexpected for consumers of your class.\n\n**BAD:**\n```dart\nclass Field {\n}\n\nclass Bad {\n  final Field someField;\n\n  Bad(this.someField);\n\n  @override\n  bool operator ==(Object other) {\n    Bad otherBad = other as Bad; // LINT\n    bool areEqual = otherBad != null && otherBad.someField == someField;\n    return areEqual;\n  }\n\n  @override\n  int get hashCode {\n    return someField.hashCode;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Field {\n}\n\nclass Good {\n  final Field someField;\n\n  Good(this.someField);\n\n  @override\n  bool operator ==(Object other) {\n    if (identical(this, other)) {\n      return true;\n    }\n    return other is Good &&\n        this.someField == other.someField;\n  }\n\n  @override\n  int get hashCode {\n    return someField.hashCode;\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "throw_in_finally",
    "description": "Avoid `throw` in `finally` block.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**AVOID** throwing exceptions in `finally` blocks.\n\nThrowing exceptions in `finally` blocks will inevitably cause unexpected\nbehavior that is hard to debug.\n\n**BAD:**\n```dart\nclass BadThrow {\n  double nonCompliantMethod() {\n    try {\n      print('hello world! ${1 / 0}');\n    } catch (e) {\n      print(e);\n    } finally {\n      throw 'Find the hidden error :P'; // LINT\n    }\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Ok {\n  double compliantMethod() {\n    var i = 5;\n    try {\n      i = 1 / 0;\n    } catch (e) {\n      print(e); // OK\n    }\n    return i;\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "tighten_type_of_initializing_formals",
    "description": "Tighten type of initializing formal.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Tighten the type of an initializing formal if a non-null assert exists. This\nallows the type system to catch problems rather than have them only be caught at\nrun-time.\n\n**BAD:**\n```dart\nclass A {\n  A.c1(this.p) : assert(p != null);\n  A.c2(this.p);\n  final String? p;\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  A.c1(String this.p);\n  A.c2(this.p);\n  final String? p;\n}\n\nclass B {\n  String? b;\n  B(this.b);\n}\n\nclass C extends B {\n  B(String super.b);\n}\n```",
    "sinceDartSdk": "2.12"
  },
  {
    "name": "type_annotate_public_apis",
    "description": "Type annotate public APIs.",
    "categories": [
      "effectiveDart",
      "publicInterface"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#do-type-annotate-fields-and-top-level-variables-if-the-type-isnt-obvious):\n\n**PREFER** type annotating public APIs.\n\nType annotations are important documentation for how a library should be used.\nAnnotating the parameter and return types of public methods and functions helps\nusers understand what the API expects and what it provides.\n\nNote that if a public API accepts a range of values that Dart's type system\ncannot express, then it is acceptable to leave that untyped.  In that case, the\nimplicit `dynamic` is the correct type for the API.\n\nFor code internal to a library (either private, or things like nested functions)\nannotate where you feel it helps, but don't feel that you *must* provide them.\n\n**BAD:**\n```dart\ninstall(id, destination) {\n  // ...\n}\n```\n\nHere, it's unclear what `id` is.  A string? And what is `destination`? A string\nor a `File` object? Is this method synchronous or asynchronous?\n\n**GOOD:**\n```dart\nFuture<bool> install(PackageId id, String destination) {\n  // ...\n}\n```\n\nWith types, all of this is clarified.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "type_init_formals",
    "description": "Don't type annotate initializing formals.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#dont-type-annotate-initializing-formals):\n\n**DON'T** type annotate initializing formals.\n\nIf a constructor parameter is using `this.x` to initialize a field, then the\ntype of the parameter is understood to be the same type as the field. If a\na constructor parameter is using `super.x` to forward to a super constructor,\nthen the type of the parameter is understood to be the same as the super\nconstructor parameter.\n\nType annotating an initializing formal with a different type than that of the\nfield is OK.\n\n**BAD:**\n```dart\nclass Point {\n  int x, y;\n  Point(int this.x, int this.y);\n}\n```\n\n**GOOD:**\n```dart\nclass Point {\n  int x, y;\n  Point(this.x, this.y);\n}\n```\n\n**BAD:**\n```dart\nclass A {\n  int a;\n  A(this.a);\n}\n\nclass B extends A {\n  B(int super.a);\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  int a;\n  A(this.a);\n}\n\nclass B extends A {\n  B(super.a);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "type_literal_in_constant_pattern",
    "description": "Don't use constant patterns with type literals.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "If you meant to test if the object has type `Foo`, instead write `Foo _`.\n\n**BAD:**\n```dart\nvoid f(Object? x) {\n  if (x case num) {\n    print('int or double');\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid f(Object? x) {\n  if (x case num _) {\n    print('int or double');\n  }\n}\n```\n\nIf you do mean to test that the matched value (which you expect to have the\ntype `Type`) is equal to the type literal `Foo`, then this lint can be\nsilenced using `const (Foo)`.\n\n**BAD:**\n```dart\nvoid f(Object? x) {\n  if (x case int) {\n    print('int');\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid f(Object? x) {\n  if (x case const (int)) {\n    print('int');\n  }\n}\n```",
    "sinceDartSdk": "3.0"
  },
  {
    "name": "unawaited_futures",
    "description": "`Future` results in `async` function bodies must be `await`ed or marked `unawaited` using `dart:async`.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** await functions that return a `Future` inside of an async function body.\n\nIt's easy to forget await in async methods as naming conventions usually don't\ntell us if a method is sync or async (except for some in `dart:io`).\n\nWhen you really _do_ want to start a fire-and-forget `Future`, the recommended\nway is to use `unawaited` from `dart:async`. The `// ignore` and\n`// ignore_for_file` comments also work.\n\n**BAD:**\n```dart\nvoid main() async {\n  doSomething(); // Likely a bug.\n}\n```\n\n**GOOD:**\n```dart\nFuture doSomething() => ...;\n\nvoid main() async {\n  await doSomething();\n\n  unawaited(doSomething()); // Explicitly-ignored fire-and-forget.\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unintended_html_in_doc_comment",
    "description": "Use of angle brackets in a doc comment is treated as HTML by Markdown.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "needsFix",
    "details": "**DON'T** use angle-bracketed text, `<…>`, in a doc comment unless you want to\nwrite an HTML tag or link.\n\nMarkdown allows HTML tags as part of the Markdown code, so you can write, for\nexample, `T<sub>1</sub>`. Markdown does not restrict the allowed tags, it just\nincludes the tags verbatim in the output.\n\nDartdoc only allows some known and valid HTML tags, and will omit any disallowed\nHTML tag from the output. See the list of allowed tags and directives below.\nYour doc comment should not contain any HTML tags that are not on this list.\n\nMarkdown also allows you to write an \"auto-link\" to an URL as for example\n`<https://example.com/page.html>`, delimited only by `<...>`. Such a link is\nallowed by Dartdoc as well.\nA `<...>` delimited text is an auto-link if it is a valid absolute URL, starting\nwith a scheme of at least two characters followed by a colon, like\n`<mailto:mr_example@example.com>`.\n\nAny other other occurrence of `<word...>` or `</word...>` is likely a mistake\nand this lint will warn about it.\nIf something looks like an HTML tag, meaning it starts with `<` or `</`\nand then a letter, and it has a later matching `>`, then it's considered an\ninvalid HTML tag unless it is an auto-link, or it starts with an *allowed*\nHTML tag.\n\nSuch a mistake can, for example, happen if writing Dart code with type arguments\noutside of a code span, for example `The type List<int> is ...`, where `<int>`\nlooks like an HTML tag. Missing the end quote of a code span can have the same\neffect: ``The type `List<int> is ...`` will also treat `<int>` as an HTML tag.\n\nAllows the following HTML directives: HTML comments, `<!-- text -->`, processing\ninstructions, `<?...?>`, CDATA-sections, and `<[CDATA...]>`.\nAllows DartDoc links like `[List<int>]` which are not after a `]` or before a\n`[` or `(`, and allows the following recognized HTML tags:\n`a`, `abbr`, `address`, `area`, `article`, `aside`, `audio`, `b`,\n`bdi`, `bdo`, `blockquote`, `br`, `button`, `canvas`, `caption`,\n`cite`, `code`, `col`, `colgroup`, `data`, `datalist`, `dd`, `del`,\n`dfn`, `div`, `dl`, `dt`, `em`, `fieldset`, `figcaption`, `figure`,\n`footer`, `form`, `h1`, `h2`, `h3`, `h4`, `h5`, `h6`, `header`, `hr`,\n`i`, `iframe`, `img`, `input`, `ins`, `kbd`, `keygen`, `label`,\n`legend`, `li`, `link`, `main`, `map`, `mark`, `meta`, `meter`, `nav`,\n`noscript`, `object`, `ol`, `optgroup`, `option`, `output`, `p`,\n`param`, `pre`, `progress`, `q`, `s`, `samp`, `script`, `section`,\n`select`, `small`, `source`, `span`, `strong`, `style`, `sub`, `sup`,\n`table`, `tbody`, `td`, `template`, `textarea`, `tfoot`, `th`, `thead`,\n`time`, `title`, `tr`, `track`, `u`, `ul`, `var`, `video` and `wbr`.\n\n**BAD:**\n```dart\n/// The type List<int>.\n/// <assignment> -> <variable> = <expression>\n```\n\n**GOOD:**\n```dart\n/// The type `List<int>`.\n/// The type [List<int>]\n/// `<assignment> -> <variable> = <expression>`\n/// \\<assignment\\> -> \\<variable\\> = \\<expression\\>`\n/// <http://foo.bar.baz>\n```",
    "sinceDartSdk": "3.5"
  },
  {
    "name": "unnecessary_await_in_return",
    "description": "Unnecessary `await` keyword in return.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Avoid returning an awaited expression when the expression type is assignable to\nthe function's return type.\n\n\n**BAD:**\n```dart\nFuture<int> future;\nFuture<int> f1() async => await future;\nFuture<int> f2() async {\n  return await future;\n}\n```\n\n**GOOD:**\n```dart\nFuture<int> future;\nFuture<int> f1() => future;\nFuture<int> f2() {\n  return future;\n}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "unnecessary_brace_in_string_interps",
    "description": "Avoid using braces in interpolation when not needed.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** using braces in interpolation when not needed.\n\nIf you're just interpolating a simple identifier, and it's not immediately\nfollowed by more alphanumeric text, the `{}` can and should be omitted.\n\n**BAD:**\n```dart\nprint(\"Hi, ${name}!\");\n```\n\n**GOOD:**\n```dart\nprint(\"Hi, $name!\");\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_breaks",
    "description": "Don't use explicit `break`s when a break is implied.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Only use a `break` in a non-empty switch case statement if you need to break\nbefore the end of the case body.  Dart does not support fallthrough execution\nfor non-empty cases, so `break`s at the end of non-empty switch case statements\nare unnecessary.\n\n**BAD:**\n```dart\nswitch (1) {\n  case 1:\n    print(\"one\");\n    break;\n  case 2:\n    print(\"two\");\n    break;\n}\n```\n\n**GOOD:**\n```dart\nswitch (1) {\n  case 1:\n    print(\"one\");\n  case 2:\n    print(\"two\");\n}\n```\n\n```dart\nswitch (1) {\n  case 1:\n  case 2:\n    print(\"one or two\");\n}\n```\n\n```dart\nswitch (1) {\n  case 1:\n    break;\n  case 2:\n    print(\"just two\");\n}\n```\n\nNOTE: This lint only reports unnecessary breaks in libraries with a\n[language version](https://dart.dev/guides/language/evolution#language-versioning)\nof 3.0 or greater. Explicit breaks are still required in Dart 2.19 and below.",
    "sinceDartSdk": "3.0"
  },
  {
    "name": "unnecessary_const",
    "description": "Avoid `const` keyword.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** repeating `const` keyword in a `const` context.\n\n**BAD:**\n```dart\nclass A { const A(); }\nm(){\n  const a = const A();\n  final b = const [const A()];\n}\n```\n\n**GOOD:**\n```dart\nclass A { const A(); }\nm(){\n  const a = A();\n  final b = const [A()];\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_constructor_name",
    "description": "Unnecessary `.new` constructor name.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** using the default unnamed Constructor over `.new`.\n\nGiven a class `C`, the named unnamed constructor `C.new` refers to the same\nconstructor as the unnamed `C`. As such it adds nothing but visual noise to\ninvocations and should be avoided (unless being used to identify a constructor\ntear-off).\n\n**BAD:**\n```dart\nclass A {\n  A.new(); // LINT\n}\n\nvar a = A.new(); // LINT\n```\n\n**GOOD:**\n```dart\nclass A {\n  A.ok();\n}\n\nvar a = A();\nvar aa = A.ok();\nvar makeA = A.new;\n```",
    "sinceDartSdk": "2.15"
  },
  {
    "name": "unnecessary_final",
    "description": "Don't use `final` for local variables.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [
      "prefer_final_locals",
      "prefer_final_parameters"
    ],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Use `var`, not `final`, when declaring local variables.\n\nPer [Effective Dart](https://dart.dev/effective-dart/usage#do-follow-a-consistent-rule-for-var-and-final-on-local-variables),\nthere are two styles in wide use. This rule enforces the `var` style.\nFor the alternative style that prefers `final`, enable `prefer_final_locals`\nand `prefer_final_in_for_each` instead.\n\nFor fields, `final` is always recommended; see the rule `prefer_final_fields`.\n\n**BAD:**\n```dart\nvoid badMethod() {\n  final label = 'Final or var?';\n  for (final char in ['v', 'a', 'r']) {\n    print(char);\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid goodMethod() {\n  var label = 'Final or var?';\n  for (var char in ['v', 'a', 'r']) {\n    print(char);\n  }\n}\n```",
    "sinceDartSdk": "2.7"
  },
  {
    "name": "unnecessary_getters_setters",
    "description": "Avoid wrapping fields in getters and setters just to be \"safe\".",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#dont-wrap-a-field-in-a-getter-and-setter-unnecessarily):\n\n**AVOID** wrapping fields in getters and setters just to be \"safe\".\n\nIn Java and C#, it's common to hide all fields behind getters and setters (or\nproperties in C#), even if the implementation just forwards to the field.  That\nway, if you ever need to do more work in those members, you can do it without needing\nto touch the callsites.  This is because calling a getter method is different\nthan accessing a field in Java, and accessing a property isn't binary-compatible\nwith accessing a raw field in C#.\n\nDart doesn't have this limitation.  Fields and getters/setters are completely\nindistinguishable.  You can expose a field in a class and later wrap it in a\ngetter and setter without having to touch any code that uses that field.\n\n**BAD:**\n```dart\nclass Box {\n  var _contents;\n  get contents => _contents;\n  set contents(value) {\n    _contents = value;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Box {\n  var contents;\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_lambdas",
    "description": "Don't create a lambda when a tear-off will do.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DON'T** create a lambda when a tear-off will do.\n\n**BAD:**\n```dart\nnames.forEach((name) {\n  print(name);\n});\n```\n\n**GOOD:**\n```dart\nnames.forEach(print);\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_late",
    "description": "Don't specify the `late` modifier when it is not needed.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** not specify the `late` modifier for top-level and static variables\nwhen the declaration contains an initializer.\n\nTop-level and static variables with initializers are already evaluated lazily\nas if they are marked `late`.\n\n**BAD:**\n```dart\nlate String badTopLevel = '';\n```\n\n**GOOD:**\n```dart\nString goodTopLevel = '';\n```\n\n**BAD:**\n```dart\nclass BadExample {\n  static late String badStatic = '';\n}\n```\n\n**GOOD:**\n```dart\nclass GoodExample {\n  late String goodStatic;\n}\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "unnecessary_library_directive",
    "description": "Avoid library directives unless they have documentation comments or annotations.",
    "categories": [
      "brevity"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use library directives if you want to document a library and/or annotate\na library.\n\n**BAD:**\n```dart\nlibrary;\n```\n\n**GOOD:**\n```dart\n/// This library does important things\nlibrary;\n```\n\n```dart\n@TestOn('js')\nlibrary;\n```\n\nNOTE: Due to limitations with this lint, libraries with parts will not be\nflagged for unnecessary library directives.",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "unnecessary_library_name",
    "description": "Don't have a library name in a `library` declaration.",
    "categories": [
      "brevity",
      "languageFeatureUsage",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** have a library name in a `library` declaration.\n\nLibrary names are not necessary.\n\nA library does not need a library declaration, but one can be added to attach\nlibrary documentation and library metadata to. A declaration of `library;` is\nsufficient for those uses.\n\nThe only *use* of a library name is for a `part` file to refer back to its\nowning library, but part files should prefer to use a string URI to refer back\nto the library file, not a library name.\n\nIf a library name is added to a library declaration, it introduces the risk of\nname *conflicts*. It's a compile-time error if two libraries in the same program\nhave the same library name. To avoid that, library names tend to be long,\nincluding the package name and path, just to avoid accidental name clashes. That\nmakes such library names hard to read, and not even useful as documentation.\n\n**BAD:**\n```dart\n/// This library has a long name.\nlibrary magnificator.src.helper.bananas;\n```\n\n```dart\nlibrary utils; // Not as verbose, but risks conflicts.\n```\n\n**GOOD:**\n```dart\n/// This library is awesome.\nlibrary;\n\npart \"apart.dart\"; // contains: `part of \"good_library.dart\";`\n```",
    "sinceDartSdk": "3.4"
  },
  {
    "name": "unnecessary_new",
    "description": "Unnecessary new keyword.",
    "categories": [
      "brevity",
      "languageFeatureUsage",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** new keyword to create instances.\n\n**BAD:**\n```dart\nclass A { A(); }\nm(){\n  final a = new A();\n}\n```\n\n**GOOD:**\n```dart\nclass A { A(); }\nm(){\n  final a = A();\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_null_aware_assignments",
    "description": "Avoid `null` in `null`-aware assignment.",
    "categories": [
      "brevity",
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** `null` in `null`-aware assignment.\n\nUsing `null` on the right-hand side of a `null`-aware assignment effectively\nmakes the assignment redundant.\n\n**BAD:**\n```dart\nvar x;\nx ??= null;\n```\n\n**GOOD:**\n```dart\nvar x;\nx ??= 1;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_null_aware_operator_on_extension_on_nullable",
    "description": "Unnecessary null aware operator on extension on a nullable type.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Avoid null aware operators for members defined in an extension on a nullable\ntype.\n\n**BAD:**\n\n```dart\nextension E on int? {\n  int m() => 1;\n}\nf(int? i) => i?.m();\n```\n\n**GOOD:**\n\n```dart\nextension E on int? {\n  int m() => 1;\n}\nf(int? i) => i.m();\n```",
    "sinceDartSdk": "2.18"
  },
  {
    "name": "unnecessary_null_checks",
    "description": "Unnecessary `null` checks.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DON'T** apply a `null` check where a nullable value is accepted.\n\n**BAD:**\n```dart\nf(int? i) {}\nm() {\n  int? j;\n  f(j!);\n}\n\n```\n\n**GOOD:**\n```dart\nf(int? i) {}\nm() {\n  int? j;\n  f(j);\n}\n```",
    "sinceDartSdk": "2.12"
  },
  {
    "name": "unnecessary_null_in_if_null_operators",
    "description": "Avoid using `null` in `??` operators.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**AVOID** using `null` as an operand in `??` operators.\n\nUsing `null` in an `if null` operator is redundant, regardless of which side\n`null` is used on.\n\n**BAD:**\n```dart\nvar x = a ?? null;\nvar y = null ?? 1;\n```\n\n**GOOD:**\n```dart\nvar x = a ?? 1;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_nullable_for_final_variable_declarations",
    "description": "Use a non-nullable type for a final variable initialized with a non-nullable value.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Use a non-nullable type for a final variable initialized with a non-nullable\nvalue.\n\n**BAD:**\n```dart\nfinal int? i = 1;\n```\n\n**GOOD:**\n```dart\nfinal int i = 1;\n```",
    "sinceDartSdk": "2.10"
  },
  {
    "name": "unnecessary_overrides",
    "description": "Don't override a method to do a super method invocation with the same parameters.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** override a method to do a super method invocation with same parameters.\n\n**BAD:**\n```dart\nclass A extends B {\n  @override\n  void foo() {\n    super.foo();\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass A extends B {\n  @override\n  void foo() {\n    doSomethingElse();\n  }\n}\n```\n\nIt's valid to override a member in the following cases:\n\n* if a type (return type or a parameter type) is not the exactly the same as the\n  super member,\n* if the `covariant` keyword is added to one of the parameters,\n* if documentation comments are present on the member,\n* if the member has annotations other than `@override`,\n* if the member is not annotated with `@protected`, and the super member is.\n\n`noSuchMethod` is a special method and is not checked by this rule.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_parenthesis",
    "description": "Unnecessary parentheses can be removed.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**AVOID** using parentheses when not needed.\n\n**BAD:**\n```dart\na = (b);\n```\n\n**GOOD:**\n```dart\na = b;\n```\n\nParentheses are considered unnecessary if they do not change the meaning of the\ncode and they do not improve the readability of the code. The goal is not to\nforce all developers to maintain the expression precedence table in their heads,\nwhich is why the second condition is included. Examples of this condition\ninclude:\n\n* cascade expressions - it is sometimes not clear what the target of a cascade\n  expression is, especially with assignments, or nested cascades. For example,\n  the expression `a.b = (c..d)`.\n* expressions with whitespace between tokens - it can look very strange to see\n  an expression like `!await foo` which is valid and equivalent to\n  `!(await foo)`.\n* logical expressions - parentheses can improve the readability of the implicit\n  grouping defined by precedence. For example, the expression\n  `(a && b) || c && d`.",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_raw_strings",
    "description": "Unnecessary raw string.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Use raw string only when needed.\n\n**BAD:**\n```dart\nvar s1 = r'a';\n```\n\n**GOOD:**\n```dart\nvar s1 = 'a';\nvar s2 = r'$a';\nvar s3 = r'\\a';\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "unnecessary_statements",
    "description": "Avoid using unnecessary statements.",
    "categories": [
      "brevity",
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**AVOID** using unnecessary statements.\n\nStatements which have no clear effect are usually unnecessary, or should be\nbroken up.\n\nFor example,\n\n**BAD:**\n```dart\nmyvar;\nlist.clear;\n1 + 2;\nmethodOne() + methodTwo();\nfoo ? bar : baz;\n```\n\nThough the added methods have a clear effect, the addition itself does not\nunless there is some magical overload of the + operator.\n\nUsually code like this indicates an incomplete thought, and is a bug.\n\n**GOOD:**\n```dart\nsome.method();\nconst SomeClass();\nmethodOne();\nmethodTwo();\nfoo ? bar() : baz();\nreturn myvar;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_string_escapes",
    "description": "Remove unnecessary backslashes in strings.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Remove unnecessary backslashes in strings.\n\n**BAD:**\n```dart\n'this string contains 2 \\\"double quotes\\\" ';\n\"this string contains 2 \\'single quotes\\' \";\n```\n\n**GOOD:**\n```dart\n'this string contains 2 \"double quotes\" ';\n\"this string contains 2 'single quotes' \";\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "unnecessary_string_interpolations",
    "description": "Unnecessary string interpolation.",
    "categories": [
      "brevity",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DON'T** use string interpolation if there's only a string expression in it.\n\n**BAD:**\n```dart\nString message;\nString o = '$message';\n```\n\n**GOOD:**\n```dart\nString message;\nString o = message;\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "unnecessary_this",
    "description": "Don't access members with `this` unless avoiding shadowing.",
    "categories": [
      "brevity",
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#dont-use-this-when-not-needed-to-avoid-shadowing):\n\n**DON'T** use `this` when not needed to avoid shadowing.\n\n**BAD:**\n```dart\nclass Box {\n  int value;\n  void update(int newValue) {\n    this.value = newValue;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Box {\n  int value;\n  void update(int newValue) {\n    value = newValue;\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Box {\n  int value;\n  void update(int value) {\n    this.value = value;\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unnecessary_to_list_in_spreads",
    "description": "Unnecessary `toList()` in spreads.",
    "categories": [
      "brevity"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Unnecessary `toList()` in spreads.\n\n**BAD:**\n```dart\nchildren: <Widget>[\n  ...['foo', 'bar', 'baz'].map((String s) => Text(s)).toList(),\n]\n```\n\n**GOOD:**\n```dart\nchildren: <Widget>[\n  ...['foo', 'bar', 'baz'].map((String s) => Text(s)),\n]\n```",
    "sinceDartSdk": "2.18"
  },
  {
    "name": "unreachable_from_main",
    "description": "Unreachable top-level members in executable libraries.",
    "categories": [
      "unusedCode"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Any member declared in an executable library should be used directly inside that\nlibrary.  An executable library is a library that contains a `main` top-level\nfunction or that contains a top-level function annotated with\n`@pragma('vm:entry-point')`).  Executable libraries are not usually imported\nand it's better to avoid defining unused members.\n\nThis rule assumes that an executable library isn't imported by other libraries\nexcept to execute its `main` function.\n\n**BAD:**\n\n```dart\nmain() {}\nvoid f() {}\n```\n\n**GOOD:**\n\n```dart\nmain() {\n  f();\n}\nvoid f() {}\n```",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "unrelated_type_equality_checks",
    "description": "Equality operator `==` invocation with references of unrelated types.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "needsEvaluation",
    "details": "**DON'T** Compare references of unrelated types for equality.\n\nComparing references of a type where neither is a subtype of the other most\nlikely will return `false` and might not reflect programmer's intent.\n\n`Int64` and `Int32` from `package:fixnum` allow comparing to `int` provided\nthe `int` is on the right hand side. The lint allows this as a special case.\n\n**BAD:**\n```dart\nvoid someFunction() {\n  var x = '1';\n  if (x == 1) print('someFunction'); // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction1() {\n  String x = '1';\n  if (x == 1) print('someFunction1'); // LINT\n}\n```\n\n**BAD:**\n```dart\nvoid someFunction13(DerivedClass2 instance) {\n  var other = DerivedClass3();\n\n  if (other == instance) print('someFunction13'); // LINT\n}\n\nclass ClassBase {}\n\nclass DerivedClass1 extends ClassBase {}\n\nabstract class Mixin {}\n\nclass DerivedClass2 extends ClassBase with Mixin {}\n\nclass DerivedClass3 extends ClassBase implements Mixin {}\n```\n\n**GOOD:**\n```dart\nvoid someFunction2() {\n  var x = '1';\n  var y = '2';\n  if (x == y) print(someFunction2); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction3() {\n  for (var i = 0; i < 10; i++) {\n    if (i == 0) print(someFunction3); // OK\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction4() {\n  var x = '1';\n  if (x == null) print(someFunction4); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction7() {\n  List someList;\n\n  if (someList.length == 0) print('someFunction7'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction8(ClassBase instance) {\n  DerivedClass1 other;\n\n  if (other == instance) print('someFunction8'); // OK\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction10(unknown) {\n  var what = unknown - 1;\n  for (var index = 0; index < unknown; index++) {\n    if (what == index) print('someFunction10'); // OK\n  }\n}\n```\n\n**GOOD:**\n```dart\nvoid someFunction11(Mixin instance) {\n  var other = DerivedClass2();\n\n  if (other == instance) print('someFunction11'); // OK\n  if (other != instance) print('!someFunction11'); // OK\n}\n\nclass ClassBase {}\n\nabstract class Mixin {}\n\nclass DerivedClass2 extends ClassBase with Mixin {}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "unsafe_html",
    "description": "Avoid unsafe HTML APIs.",
    "categories": [
      "errorProne"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**AVOID**\n\n* assigning directly to the `href` field of an AnchorElement\n* assigning directly to the `src` field of an EmbedElement, IFrameElement, or\n  ScriptElement\n* assigning directly to the `srcdoc` field of an IFrameElement\n* calling the `createFragment` method of Element\n* calling the `open` method of Window\n* calling the `setInnerHtml` method of Element\n* calling the `Element.html` constructor\n* calling the `DocumentFragment.html` constructor\n\n\n**BAD:**\n```dart\nvar script = ScriptElement()..src = 'foo.js';\n```",
    "sinceDartSdk": "2.4"
  },
  {
    "name": "use_build_context_synchronously",
    "description": "Do not use `BuildContext` across asynchronous gaps.",
    "categories": [
      "errorProne",
      "flutter"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DON'T** use `BuildContext` across asynchronous gaps.\n\nStoring `BuildContext` for later usage can easily lead to difficult to diagnose\ncrashes. Asynchronous gaps are implicitly storing `BuildContext` and are some of\nthe easiest to overlook when writing code.\n\nWhen a `BuildContext` is used, a `mounted` property must be checked after an\nasynchronous gap, depending on how the `BuildContext` is accessed:\n\n* When using a `State`'s `context` property, the `State`'s `mounted` property\n  must be checked.\n* For other `BuildContext` instances (like a local variable or function\n  argument), the `BuildContext`'s `mounted` property must be checked.\n\n**BAD:**\n```dart\nvoid onButtonTapped(BuildContext context) async {\n  await Future.delayed(const Duration(seconds: 1));\n  Navigator.of(context).pop();\n}\n```\n\n**GOOD:**\n```dart\nvoid onButtonTapped(BuildContext context) {\n  Navigator.of(context).pop();\n}\n```\n\n**GOOD:**\n```dart\nvoid onButtonTapped(BuildContext context) async {\n  await Future.delayed(const Duration(seconds: 1));\n\n  if (!context.mounted) return;\n  Navigator.of(context).pop();\n}\n```\n\n**GOOD:**\n```dart\nabstract class MyState extends State<MyWidget> {\n  void foo() async {\n    await Future.delayed(const Duration(seconds: 1));\n    if (!mounted) return; // Checks `this.mounted`, not `context.mounted`.\n    Navigator.of(context).pop();\n  }\n}\n```",
    "sinceDartSdk": "2.13"
  },
  {
    "name": "use_colored_box",
    "description": "Use `ColoredBox`.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use `ColoredBox` when `Container` has only a `Color`.\n\nA `Container` is a heavier Widget than a `ColoredBox`, and as bonus,\n`ColoredBox` has a `const` constructor.\n\n**BAD:**\n```dart\nWidget buildArea() {\n  return Container(\n    color: Colors.blue,\n    child: const Text('hello'),\n  );\n}\n```\n\n**GOOD:**\n```dart\nWidget buildArea() {\n  return const ColoredBox(\n    color: Colors.blue,\n    child: Text('hello'),\n  );\n}\n```",
    "sinceDartSdk": "2.17"
  },
  {
    "name": "use_decorated_box",
    "description": "Use `DecoratedBox`.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use `DecoratedBox` when `Container` has only a `Decoration`.\n\nA `Container` is a heavier Widget than a `DecoratedBox`, and as bonus,\n`DecoratedBox` has a `const` constructor.\n\n**BAD:**\n```dart\nWidget buildArea() {\n  return Container(\n    decoration: const BoxDecoration(\n      color: Colors.blue,\n      borderRadius: BorderRadius.all(\n        Radius.circular(5),\n      ),\n    ),\n    child: const Text('...'),\n  );\n}\n```\n\n**GOOD:**\n```dart\nWidget buildArea() {\n  return const DecoratedBox(\n    decoration: BoxDecoration(\n      color: Colors.blue,\n      borderRadius: BorderRadius.all(\n        Radius.circular(5),\n      ),\n    ),\n    child: Text('...'),\n  );\n}\n```",
    "sinceDartSdk": "2.16"
  },
  {
    "name": "use_enums",
    "description": "Use enums rather than classes that behave like enums.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Classes that look like enumerations should be declared as `enum`s.\n\n**DO** use enums where appropriate.\n\nCandidates for enums are classes that:\n\n  * are concrete,\n  * are private or have only private generative constructors,\n  * have two or more static const fields with the same type as the class,\n  * have generative constructors that are only invoked at the top-level of the\n    initialization expression of these static fields,\n  * do not define `hashCode`, `==`, `values` or `index`,\n  * do not extend any class other than `Object`, and\n  * have no subclasses declared in the defining library.\n\nTo learn more about creating and using these enums, check out\n[Declaring enhanced enums](https://dart.dev/language/enums#declaring-enhanced-enums).\n\n**BAD:**\n```dart\nclass LogPriority {\n  static const error = LogPriority._(1, 'Error');\n  static const warning = LogPriority._(2, 'Warning');\n  static const log = LogPriority._unknown('Log');\n\n  final String prefix;\n  final int priority;\n  const LogPriority._(this.priority, this.prefix);\n  const LogPriority._unknown(String prefix) : this._(-1, prefix);\n}\n```\n\n**GOOD:**\n```dart\nenum LogPriority {\n  error(1, 'Error'),\n  warning(2, 'Warning'),\n  log.unknown('Log');\n\n  final String prefix;\n  final int priority;\n  const LogPriority(this.priority, this.prefix);\n  const LogPriority.unknown(String prefix) : this(-1, prefix);\n}\n```",
    "sinceDartSdk": "2.17"
  },
  {
    "name": "use_full_hex_values_for_flutter_colors",
    "description": "Prefer an 8-digit hexadecimal integer (for example, 0xFFFFFFFF) to instantiate a Color.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**PREFER** an 8-digit hexadecimal integer (for example, 0xFFFFFFFF) to\ninstantiate a Color. Colors have four 8-bit channels, which adds up to 32 bits,\nso Colors are described using a 32-bit integer.\n\n**BAD:**\n```dart\nColor(1);\nColor(0x000001);\n```\n\n**GOOD:**\n```dart\nColor(0x00000001);\n```",
    "sinceDartSdk": "2.2"
  },
  {
    "name": "use_function_type_syntax_for_parameters",
    "description": "Use generic function type syntax for parameters.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "Use generic function type syntax for parameters.\n\n**BAD:**\n```dart\nIterable<T> where(bool predicate(T element)) {}\n```\n\n**GOOD:**\n```dart\nIterable<T> where(bool Function(T) predicate) {}\n```",
    "sinceDartSdk": "2.1"
  },
  {
    "name": "use_if_null_to_convert_nulls_to_bools",
    "description": "Use `??` operators to convert `null`s to `bool`s.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#prefer-using--to-convert-null-to-a-boolean-value):\n\nUse `??` operators to convert `null`s to `bool`s.\n\n**BAD:**\n```dart\nif (nullableBool == true) {\n}\nif (nullableBool != false) {\n}\n```\n\n**GOOD:**\n```dart\nif (nullableBool ?? false) {\n}\nif (nullableBool ?? true) {\n}\n```",
    "sinceDartSdk": "2.13"
  },
  {
    "name": "use_is_even_rather_than_modulo",
    "description": "Prefer intValue.isOdd/isEven instead of checking the result of % 2.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**PREFER** the use of intValue.isOdd/isEven to check for evenness.\n\n**BAD:**\n```dart\nbool isEven = 1 % 2 == 0;\nbool isOdd = 13 % 2 == 1;\n```\n\n**GOOD:**\n```dart\nbool isEven = 1.isEven;\nbool isOdd = 13.isOdd;\n```",
    "sinceDartSdk": "2.9"
  },
  {
    "name": "use_key_in_widget_constructors",
    "description": "Use key in widget constructors.",
    "categories": [
      "flutter",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "**DO** use key in widget constructors.\n\nIt's a good practice to expose the ability to provide a key when creating public\nwidgets.\n\n**BAD:**\n```dart\nclass MyPublicWidget extends StatelessWidget {\n}\n```\n\n**GOOD:**\n```dart\nclass MyPublicWidget extends StatelessWidget {\n  MyPublicWidget({super.key});\n}\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "use_late_for_private_fields_and_variables",
    "description": "Use late for private members with a non-nullable type.",
    "categories": [
      "style"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Use `late` for private members with non-nullable types that are always expected\nto be non-null. Thus it's clear that the field is not expected to be `null`\nand it avoids null checks.\n\n**BAD:**\n```dart\nint? _i;\nm() {\n  _i!.abs();\n}\n```\n\n**GOOD:**\n```dart\nlate int _i;\nm() {\n  _i.abs();\n}\n```\n\n**OK:**\n```dart\nint? _i;\nm() {\n  _i?.abs();\n  _i = null;\n}\n```",
    "sinceDartSdk": "2.10"
  },
  {
    "name": "use_named_constants",
    "description": "Use predefined named constants.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "Where possible, use already defined const values.\n\n**BAD:**\n```dart\nconst Duration(seconds: 0);\n```\n\n**GOOD:**\n```dart\nDuration.zero;\n```",
    "sinceDartSdk": "2.13"
  },
  {
    "name": "use_raw_strings",
    "description": "Use raw string to avoid escapes.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "A raw string can be used to avoid escaping only backslashes and dollars.\n\n**BAD:**\n```dart\nvar s = 'A string with only \\\\ and \\$';\n```\n\n**GOOD:**\n```dart\nvar s = r'A string with only \\ and $';\n```",
    "sinceDartSdk": "2.8"
  },
  {
    "name": "use_rethrow_when_possible",
    "description": "Use rethrow to rethrow a caught exception.",
    "categories": [
      "brevity",
      "effectiveDart"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#do-use-rethrow-to-rethrow-a-caught-exception):\n\n**DO** use rethrow to rethrow a caught exception.\n\nAs Dart provides rethrow as a feature, it should be used to improve terseness\nand readability.\n\n**BAD:**\n```dart\ntry {\n  somethingRisky();\n} catch(e) {\n  if (!canHandle(e)) throw e;\n  handle(e);\n}\n```\n\n**GOOD:**\n```dart\ntry {\n  somethingRisky();\n} catch(e) {\n  if (!canHandle(e)) rethrow;\n  handle(e);\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "use_setters_to_change_properties",
    "description": "Use a setter for operations that conceptually change a property.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "**DO** use a setter for operations that conceptually change a property.\n\n**BAD:**\n```dart\nrectangle.setWidth(3);\nbutton.setVisible(false);\n```\n\n**GOOD:**\n```dart\nrectangle.width = 3;\nbutton.visible = false;\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "use_string_buffers",
    "description": "Use string buffers to compose strings.",
    "categories": [
      "nonPerformant"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "**DO** use string buffers to compose strings.\n\nIn most cases, using a string buffer is preferred for composing strings due to\nits improved performance.\n\n**BAD:**\n```dart\nString foo() {\n  final buffer = '';\n  for (int i = 0; i < 10; i++) {\n    buffer += 'a'; // LINT\n  }\n  return buffer;\n}\n```\n\n**GOOD:**\n```dart\nString foo() {\n  final buffer = StringBuffer();\n  for (int i = 0; i < 10; i++) {\n    buffer.write('a');\n  }\n  return buffer.toString();\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "use_string_in_part_of_directives",
    "description": "Use string in part of directives.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/usage#do-use-strings-in-part-of-directives):\n\n**DO** use strings in `part of` directives.\n\n**BAD:**\n\n```dart\npart of my_library;\n```\n\n**GOOD:**\n\n```dart\npart of '../../my_library.dart';\n```",
    "sinceDartSdk": "2.19"
  },
  {
    "name": "use_super_parameters",
    "description": "Use super-initializer parameters where possible.",
    "categories": [
      "brevity"
    ],
    "state": "experimental",
    "incompatible": [],
    "sets": [
      "recommended",
      "flutter"
    ],
    "fixStatus": "hasFix",
    "details": "\"Forwarding constructor\"s, that do nothing except forward parameters to their\nsuperclass constructors should take advantage of super-initializer parameters\nrather than repeating the names of parameters when passing them to the\nsuperclass constructors.  This makes the code more concise and easier to read\nand maintain.\n\n**DO** use super-initializer parameters where possible.\n\n**BAD:**\n```dart\nclass A {\n  A({int? x, int? y});\n}\nclass B extends A {\n  B({int? x, int? y}) : super(x: x, y: y);\n}\n```\n\n**GOOD:**\n```dart\nclass A {\n  A({int? x, int? y});\n}\nclass B extends A {\n  B({super.x, super.y});\n}\n```",
    "sinceDartSdk": "2.17"
  },
  {
    "name": "use_test_throws_matchers",
    "description": "Use throwsA matcher instead of fail().",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "needsFix",
    "details": "Use the `throwsA` matcher instead of try-catch with `fail()`.\n\n**BAD:**\n\n```dart\n// sync code\ntry {\n  someSyncFunctionThatThrows();\n  fail('expected Error');\n} on Error catch (error) {\n  expect(error.message, contains('some message'));\n}\n\n// async code\ntry {\n  await someAsyncFunctionThatThrows();\n  fail('expected Error');\n} on Error catch (error) {\n  expect(error.message, contains('some message'));\n}\n```\n\n**GOOD:**\n```dart\n// sync code\nexpect(\n  () => someSyncFunctionThatThrows(),\n  throwsA(isA<Error>().having((Error error) => error.message, 'message', contains('some message'))),\n);\n\n// async code\nawait expectLater(\n  () => someAsyncFunctionThatThrows(),\n  throwsA(isA<Error>().having((Error error) => error.message, 'message', contains('some message'))),\n);\n```",
    "sinceDartSdk": "2.14"
  },
  {
    "name": "use_to_and_as_if_applicable",
    "description": "Start the name of the method with to/_to or as/_as if applicable.",
    "categories": [
      "effectiveDart",
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "noFix",
    "details": "From [Effective Dart](https://dart.dev/effective-dart/design#prefer-naming-a-method-to___-if-it-copies-the-objects-state-to-a-new-object):\n\n**PREFER** naming a method `to___()` if it copies the object's state to a new\nobject.\n\n**PREFER** naming a method `as___()` if it returns a different representation\nbacked by the original object.\n\n**BAD:**\n```dart\nclass Bar {\n  Foo myMethod() {\n    return Foo.from(this);\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Bar {\n  Foo toFoo() {\n    return Foo.from(this);\n  }\n}\n```\n\n**GOOD:**\n```dart\nclass Bar {\n  Foo asFoo() {\n    return Foo.from(this);\n  }\n}\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "use_truncating_division",
    "description": "Use truncating division.",
    "categories": [
      "languageFeatureUsage"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [],
    "fixStatus": "hasFix",
    "details": "**DO** use truncating division, '~/', instead of regular division ('/') followed\nby 'toInt()'.\n\nDart features a \"truncating division\" operator which is the same operation as\ndivision followed by truncation, but which is more concise and expressive, and\nmay be more performant on some platforms, for certain inputs.\n\n**BAD:**\n```dart\nvar x = (2 / 3).toInt();\n```\n\n**GOOD:**\n```dart\nvar x = 2 ~/ 3;\n```",
    "sinceDartSdk": "3.6-wip"
  },
  {
    "name": "valid_regexps",
    "description": "Use valid regular expression syntax.",
    "categories": [
      "unintentional"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DO** use valid regular expression syntax when creating regular expression\ninstances.\n\nRegular expressions created with invalid syntax will throw a `FormatException`\nat runtime so should be avoided.\n\n**BAD:**\n```dart\nprint(RegExp(r'(').hasMatch('foo()'));\n```\n\n**GOOD:**\n```dart\nprint(RegExp(r'\\(').hasMatch('foo()'));\n```",
    "sinceDartSdk": "2.0"
  },
  {
    "name": "void_checks",
    "description": "Don't assign to `void`.",
    "categories": [
      "style"
    ],
    "state": "stable",
    "incompatible": [],
    "sets": [
      "core",
      "recommended",
      "flutter"
    ],
    "fixStatus": "noFix",
    "details": "**DON'T** assign to `void`.\n\n**BAD:**\n```dart\nclass A<T> {\n  T value;\n  void test(T arg) { }\n}\n\nvoid main() {\n  A<void> a = A<void>();\n  a.value = 1; // LINT\n  a.test(1); // LINT\n}\n```",
    "sinceDartSdk": "2.0"
  }
]""";
