# Contributing to Very Good Analysis

👍🎉 First off, thanks for taking the time to contribute! 🎉👍

These are mostly guidelines, not rules. Use your best judgment,
and feel free to propose changes to this document in a pull request.

## Proposing a Change

If you intend to change the public API, or make any non-trivial changes
to the implementation, we recommend filing an issue.
This lets us reach an agreement on your proposal before you put significant
effort into it.

If you’re only fixing a bug, it’s fine to submit a pull request right away
but we still recommend to file an issue detailing what you’re fixing.
This is helpful in case we don’t accept that specific fix but want to keep
track of the issue.

## Contributing new Dart lint rules

If you intend to provide changes related to a new Dart version you can follow these steps:

1. Ensure you are on the latest stable Dart version.
1. Run `dart tool/bump_version/main.dart <NEW_VERSION>` to generate a new version.
1. Add or remove the lint rules you want to change in the version file you generated in step 2. 
   > To find new rules more easily you can run the same command as in step 4 which will add new rules directly to the exclusion table.
1.  Open a terminal in `tool/linter_rules` and run `dart lib/exclusion_reason_table.dart` to generate an up-to-date exclusion table.
1. Document the rules that were removed with a reason as to why, if there is any.
   > Link to an issue as to why a lint rule should not be used if there is any.

## Creating a Pull Request

Before creating a pull request please:

1. Fork the repository and create your branch from `main`.
1. Install all dependencies (`dart pub get`).
1. Squash your commits and ensure you have a meaningful commit message.
1. If you’ve fixed a bug or added code that should be tested, add tests!
   Pull Requests without 100% test coverage will not be approved.
1. Ensure the test suite passes.
1. If you've changed the public API, make sure to update/add documentation.
1. Format your code (`dart format .`).
1. Analyze your code (`dart analyze . --fatal-infos`).
1. Create the Pull Request.
1. Verify that all status checks are passing.

While the prerequisites above must be satisfied prior to having your
pull request reviewed, the reviewer(s) may ask you to complete additional
design work, tests, or other changes before your pull request can be ultimately
accepted.

## Releasing new versions

Every snapshot of a version is saved on its own yaml file under the name pattern: `lib/analysis_options.<version>.yaml`.

### Release a new version

Skip step `1` if a new version file was already generated.

1. Run the `bump_version` script with the desired new version as an argument:

   ```sh
   dart tool/bump_version/main.dart <version>
   ```

   Where `<version>` is the new version to be released in the format `x.y.z`.

   This script will:

   - Copy the most recent yaml to a new one with the new desired version.
   - Include that file on the main yaml file `lib/analysis_options.yaml`.

1. Update the `README.md` exclusion table, refer to the ["Exclusion Reason Table 🗞️👨‍⚖️"](tool/linter_rules/README.md#exclusion-reason-table-️️) documentation for more information.
1. Open a pull request with the proposed changes.
