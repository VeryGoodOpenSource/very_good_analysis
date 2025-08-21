
## 9.0.0

- chore(deps): bump peter-evans/create-pull-request from 7.0.6 to 7.0.8 [139](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/139)
- chore: release 9.0.0-rc.1 [154](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/154)

## 9.0.0-rc.1

- feat: support Dart 3.8.0 [152](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/152)

## 8.0.0

- chore: release 8.0.0-rc.1
- fix: remove `omit_obvious_property_types` as it conflicts with `type_annotate_public_apis` [148](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/148)

## 8.0.0-rc.1

- feat: add `omit_obvious_property_types` [143](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/143)
- feat: add `specify_nonobvious_property_types` [143](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/143)
- feat: add `strict_top_level_inference` [143](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/143)
- feat: add `unnecessary_underscores` [143](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/143)
- feat: remove `require_trailing_commas` [143](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/143)

## 7.0.0

- chore: release 7.0.0-dev.1

## 7.0.0-dev.1

- feat: add `document_ignores` [125](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/125)
- feat: remove `avoid_null_checks_in_equality_operators` [124](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/124)
- feat: add avoid_catches_without_on_clauses [123](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/123)
- feat: add invalid_runtime_check_with_js_interop_types [122](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/122)
- feat: add unintended_html_in_doc_comment [121](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/121)
- chore: Remove the package_api_docs lint in next release [118](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/118)
- feat: update lints for Dart 3.5 [111](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/111)
- docs: update exclusion reasons [109](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/109)
- docs: update commands in contributing [110](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/110)

## 6.0.0

- chore: release 6.0.0-dev.1

## 6.0.0-dev.1

- feat!: upgrade to support Dart `^3.4.0`
- feat: additional lint rules:
  - [missing_code_block_language_in_doc_comment](https://dart.dev/tools/linter-rules/missing_code_block_language_in_doc_comment)
  - [no_self_assignments](https://dart.dev/tools/linter-rules/no_self_assignments)
  - [no_wildcard_variable_uses](https://dart.dev/tools/linter-rules/no_wildcard_variable_uses)
- docs: include exclusion reason table ([100](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/100), [102](https://github.com/VeryGoodOpenSource/very_good_analysis/pull/102))

## 5.1.0

- fix: remove deprecated `iterable_contains_unrelated_type` lint
- fix: remove deprecated `list_remove_unrelated_type` lint
- fix(docs): full list of rules
- feat: type equality checks should be warnings/errors

## 5.0.0+1

- docs: minor updates to documentation in `README.md`

## 5.0.0

- feat!: upgrade to support Dart `^3.0.0`
- feat: added analysis warning as error:
  - [record_literal_one_positional_no_trailing_comma](https://dart.dev/tools/diagnostic-messages#record_literal_one_positional_no_trailing_comma)
- feat: additional lint rules:
  - [implicit_reopen](https://dart.dev/tools/linter-rules#implicit_reopen)
  - [unnecessary_breaks](https://dart.dev/tools/linter-rules#unnecessary_breaks)
  - [invalid_case_patterns](https://github.com/dart-lang/linter/issues/4044)
- refactor: remove deprecated lint rules:
  - [prefer_equal_for_default_values](https://dart-lang.github.io/linter/lints/prefer_equal_for_default_values.html)
  - [enable_null_safety](https://dart-lang.github.io/linter/lints/enable_null_safety.html)
- refactor: remove malfunctioning rules:
  - [`use_decorated_box`](https://github.com/VeryGoodOpenSource/very_good_analysis/issues/65)

## 4.0.0+1

- docs: minor updates to documentation in `README.md`

## 4.0.0

- feat!: upgrade to support Dart `^2.19.0`
- feat: additional lint rules:

  - [always_put_required_named_parameters_first](https://dart-lang.github.io/linter/lints/always_put_required_named_parameters_first.html)
  - [collection_methods_unrelated_type](https://dart-lang.github.io/linter/lints/collection_methods_unrelated_type.html)
  - [combinators_ordering](https://dart-lang.github.io/linter/lints/combinators_ordering.html)
  - [dangling_library_doc_comments](https://dart-lang.github.io/linter/lints/dangling_library_doc_comments.html)
  - [enable_null_safety](https://dart-lang.github.io/linter/lints/enable_null_safety.html)
  - [implicit_call_tearoffs](https://dart-lang.github.io/linter/lints/implicit_call_tearoffs.html)
  - [library_annotations](https://dart-lang.github.io/linter/lints/library_annotations.html)
  - [unnecessary_library_directive](https://dart-lang.github.io/linter/lints/unnecessary_library_directive.html)
  - [use_string_in_part_of_directives](https://dart-lang.github.io/linter/lints/use_string_in_part_of_directives.html)

- refactor: remove deprecated lint rules:
  - [always_require_non_null_named_parameters](https://dart-lang.github.io/linter/lints/always_require_non_null_named_parameters.html)
  - [avoid_returning_null](https://dart-lang.github.io/linter/lints/avoid_returning_null.html)
  - [avoid_returning_null_for_future](https://dart-lang.github.io/linter/lints/avoid_returning_null_for_future.html)

## 3.1.0

- **BREAKING** refactor: remove deprecated `unawaited` (use `unawaited` from `dart:async` instead).
- feat: additional lint rules:
  - [avoid_final_parameters](https://dart-lang.github.io/linter/lints/avoid_final_parameters.html)
  - [avoid_multiple_declarations_per_line](https://dart-lang.github.io/linter/lints/avoid_multiple_declarations_per_line.html)
  - [depend_on_referenced_packages](https://dart-lang.github.io/linter/lints/depend_on_referenced_packages.html)
  - [no_leading_underscores_for_library_prefixes](https://dart-lang.github.io/linter/lints/no_leading_underscores_for_library_prefixes.html)
  - [no_leading_underscores_for_local_identifiers](https://dart-lang.github.io/linter/lints/no_leading_underscores_for_local_identifiers.html)
  - [unnecessary_to_list_in_spreads](https://dart-lang.github.io/linter/lints/unnecessary_to_list_in_spreads.html)
  - [use_if_null_to_convert_nulls_to_bools](https://dart-lang.github.io/linter/lints/use_if_null_to_convert_nulls_to_bools.html)
  - [use_test_throws_matchers](https://dart-lang.github.io/linter/lints/use_test_throws_matchers.html)

## 3.0.2

- fix: remove deprecated `invariant_booleans` lint
- fix: deprecate `unawaited` (use `unawaited` from `dart:async` instead).

## 3.0.1

- feat: use analyzer language modes instead of deprecated `strong-mode`
  ```yaml
  language:
    strict-casts: true
    strict-inference: true
    strict-raw-types: true
  ```

## 3.0.0

- feat!: upgrade to support Dart `^2.17.0`
- feat: additional lint rules:
  - [conditional_uri_does_not_exist](https://dart-lang.github.io/linter/lints/conditional_uri_does_not_exist.html)
  - [secure_pubspec_urls](https://dart-lang.github.io/linter/lints/secure_pubspec_urls.html)
  - [sized_box_shrink_expand](https://dart-lang.github.io/linter/lints/sized_box_shrink_expand.html)
  - [unnecessary_constructor_name](https://dart-lang.github.io/linter/lints/unnecessary_constructor_name.html)
  - [unnecessary_late](https://dart-lang.github.io/linter/lints/unnecessary_late.html)
  - [use_colored_box](https://dart-lang.github.io/linter/lints/use_colored_box.html)
  - [use_decorated_box](https://dart-lang.github.io/linter/lints/use_decorated_box.html)
  - [use_enums](https://dart-lang.github.io/linter/lints/use_enums.html)
  - [use_super_parameters](https://dart-lang.github.io/linter/lints/use_super_parameters.html)

## 2.4.0

- feat: additional lint rules:
  - [`avoid_js_rounded_ints`](https://dart-lang.github.io/linter/lints/avoid_js_rounded_ints.html)
  - [`avoid_positional_boolean_parameters`](https://dart-lang.github.io/linter/lints/avoid_positional_boolean_parameters.html)
  - [`avoid_private_typedef_functions`](https://dart-lang.github.io/linter/lints/avoid_private_typedef_functions.html)
  - [`eol_at_end_of_file`](https://dart-lang.github.io/linter/lints/eol_at_end_of_file.html)
  - [`flutter_style_todos`](https://dart-lang.github.io/linter/lints/flutter_style_todos.html)
  - [`library_private_types_in_public_api`](https://dart-lang.github.io/linter/lints/library_private_types_in_public_api.html)
  - [`no_default_cases`](https://dart-lang.github.io/linter/lints/no_default_cases.html)
  - [`noop_primitive_operations`](https://dart-lang.github.io/linter/lints/noop_primitive_operations.html)
  - [`one_member_abstracts`](https://dart-lang.github.io/linter/lints/one_member_abstracts.html)
  - [`parameter_assignments`](https://dart-lang.github.io/linter/lints/parameter_assignments.html)
  - [`prefer_asserts_with_message`](https://dart-lang.github.io/linter/lints/prefer_asserts_with_message.html)
  - [`prefer_constructors_over_static_methods`](https://dart-lang.github.io/linter/lints/prefer_constructors_over_static_methods.html)
  - [`prefer_null_aware_method_calls`](https://dart-lang.github.io/linter/lints/prefer_null_aware_method_calls.html)
  - [`require_trailing_commas`](https://dart-lang.github.io/linter/lints/require_trailing_commas.html)
  - [`use_is_even_rather_than_modulo`](https://dart-lang.github.io/linter/lints/use_is_even_rather_than_modulo.html)

## 2.3.0

- feat: additional analysis errors:
  - `missing_required_param`
  - `missing_return`
- feat: additional lint rules:
  - [`use_named_constants`](https://dart-lang.github.io/linter/lints/use_named_constants.html)
  - [`use_raw_strings`](https://dart-lang.github.io/linter/lints/use_raw_strings.html)
  - [`use_late_for_private_fields_and_variables`](https://dart-lang.github.io/linter/lints/use_late_for_private_fields_and_variables.html)
  - [`use_setters_to_change_properties`](https://dart-lang.github.io/linter/lints/use_setters_to_change_properties.html)
  - [`use_string_buffers`](https://dart-lang.github.io/linter/lints/use_string_buffers.html)
  - [`use_to_and_as_if_applicable`](https://dart-lang.github.io/linter/lints/use_to_and_as_if_applicable.html)
  - [`sort_pub_dependencies`](https://dart-lang.github.io/linter/lints/sort_pub_dependencies.html)
  - [`literal_only_boolean_expressions`](https://dart-lang.github.io/linter/lints/literal_only_boolean_expressions.html)
  - [`use_build_context_synchronously`](https://dart-lang.github.io/linter/lints/use_build_context_synchronously.html)
  - [`avoid_bool_literals_in_conditional_expressions`](https://dart-lang.github.io/linter/lints/avoid_bool_literals_in_conditional_expressions.html)
  - [`avoid_catching_errors`](https://dart-lang.github.io/linter/lints/avoid_catching_errors.html)
  - [`avoid_double_and_int_checks`](https://dart-lang.github.io/linter/lints/avoid_double_and_int_checks.html)
  - [`avoid_equals_and_hash_code_on_mutable_classes`](https://dart-lang.github.io/linter/lints/avoid_equals_and_hash_code_on_mutable_classes.html)
  - [`avoid_escaping_inner_quotes`](https://dart-lang.github.io/linter/lints/avoid_escaping_inner_quotes.html)
  - [`avoid_field_initializers_in_const_classes`](https://dart-lang.github.io/linter/lints/avoid_field_initializers_in_const_classes.html)
  - [`avoid_redundant_argument_values`](https://dart-lang.github.io/linter/lints/avoid_redundant_argument_values.html)
  - [`avoid_returning_this`](https://dart-lang.github.io/linter/lints/avoid_returning_this.html)
  - [`avoid_setters_without_getters`](https://dart-lang.github.io/linter/lints/avoid_setters_without_getters.html)
  - [`avoid_void_async`](https://dart-lang.github.io/linter/lints/avoid_void_async.html)
  - [`cast_nullable_to_non_nullable`](https://dart-lang.github.io/linter/lints/cast_nullable_to_non_nullable.html)
  - [`deprecated_consistency`](https://dart-lang.github.io/linter/lints/deprecated_consistency.html)
  - [`join_return_with_assignment`](https://dart-lang.github.io/linter/lints/join_return_with_assignment.html)
  - [`leading_newlines_in_multiline_strings`](https://dart-lang.github.io/linter/lints/leading_newlines_in_multiline_strings.html)
  - [`missing_whitespace_between_adjacent_strings`](https://dart-lang.github.io/linter/lints/missing_whitespace_between_adjacent_strings.html)
  - [`no_runtimeType_toString`](https://dart-lang.github.io/linter/lints/no_runtimeType_toString.html)
  - [`null_check_on_nullable_type_parameter`](https://dart-lang.github.io/linter/lints/null_check_on_nullable_type_parameter.html)
  - [`prefer_asserts_in_initializer_lists`](https://dart-lang.github.io/linter/lints/prefer_asserts_in_initializer_lists.html)
  - [`prefer_final_in_for_each`](https://dart-lang.github.io/linter/lints/prefer_final_in_for_each.html)
  - [`prefer_final_locals`](https://dart-lang.github.io/linter/lints/prefer_final_locals.html)
  - [`prefer_if_elements_to_conditional_expressions`](https://dart-lang.github.io/linter/lints/prefer_if_elements_to_conditional_expressions.html)
  - [`prefer_int_literals`](https://dart-lang.github.io/linter/lints/prefer_int_literals.html)
  - [`sort_unnamed_constructors_first`](https://dart-lang.github.io/linter/lints/sort_unnamed_constructors_first.html)
  - [`tighten_type_of_initializing_formals`](https://dart-lang.github.io/linter/lints/tighten_type_of_initializing_formals.html)
  - [`type_annotate_public_apis`](https://dart-lang.github.io/linter/lints/type_annotate_public_apis.html)
  - [`unnecessary_await_in_return`](https://dart-lang.github.io/linter/lints/unnecessary_await_in_return.html)
  - [`unnecessary_null_checks`](https://dart-lang.github.io/linter/lints/unnecessary_null_checks.html)
  - [`unnecessary_nullable_for_final_variable_declarations`](https://dart-lang.github.io/linter/lints/unnecessary_nullable_for_final_variable_declarations.html)
  - [`unnecessary_parenthesis`](https://dart-lang.github.io/linter/lints/unnecessary_parenthesis.html)
  - [`unnecessary_raw_strings`](https://dart-lang.github.io/linter/lints/unnecessary_raw_strings.html)

## 2.2.0

- feat: additional lint rules:
  - `always_use_package_imports`
  - `avoid_returning_null_for_future`
  - `avoid_slow_async_io`
  - `avoid_type_to_string`

## 2.1.2

- refactor: remove deprecated `pedantic` dependency
- ci: improvements to ensure max pub score
- docs: minor documentation and package description updates

## 2.1.1

- docs: update `README` to include latest version
- docs: reword package description
- docs: consolidate `README` links

## 2.1.0

- feat: update sdk constraint to v2.12.0 stable
- feat: additional lint rules:
  - `avoid_print`
  - `avoid_returning_null_for_void`
  - `avoid_single_cascade_in_expression_statements`
  - `avoid_unnecessary_containers`
  - `avoid_web_libraries_in_flutter`
  - `curly_braces_in_flow_control_structures`
  - `exhaustive_cases`
  - `file_names`
  - `no_logic_in_create_state`
  - `prefer_const_constructors_in_immutables`
  - `prefer_const_declarations`
  - `prefer_const_literals_to_create_immutables`
  - `prefer_function_declarations_over_variables`
  - `prefer_inlined_adds`
  - `prefer_is_not_operator`
  - `prefer_null_aware_operators`
  - `prefer_void_to_null`
  - `provide_deprecation_message`
  - `sized_box_for_whitespace`
  - `unnecessary_overrides`
  - `unnecessary_string_escapes`
  - `unnecessary_string_interpolations`
  - `use_full_hex_values_for_flutter_colors`
  - `void_checks`

## 2.0.3

- feat: additional linter rule:
  - `sort_child_properties_last`

## 2.0.2

- feat: additional linter rule:
  - `use_key_in_widget_constructors`

## 2.0.1

- feat: additional linter rule:
  - `avoid_dynamic_calls`

## 2.0.0

- feat: stable null safe release

## 2.0.0-nullsafety.0

- chore: migrate to null safety

## 1.0.4

- docs: README and metadata updates

## 1.0.3

- feat: additional linter rules
  - `avoid_print`
  - `avoid_unnecessary_containers`
  - `prefer_final_in_for_each`
  - `prefer_final_locals`
  - `prefer_const_declarations`
  - `sized_box_for_whitespace`

## 1.0.2

- feat: add test/.test_coverage.dart to the list of ignored files

## 1.0.1

- docs: README improvements
- docs: inline documentation improvements

## 1.0.0

- Add `analysis_options` used at [Very Good Ventures](https://verygood.ventures)
