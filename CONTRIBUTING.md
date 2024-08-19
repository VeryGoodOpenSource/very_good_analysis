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

To release a new version:

1. Copy the most recent yaml to a new one with the new desired version.
1. Include that file on the main yaml file `lib/analysis_options.yaml`.
1. Update the `README.md` exclusion table, refer to the ["Exclusion Reason Table 🗞️👨‍⚖️"](tool/linter_rules/README.md#exclusion-reason-table-️️) documentation for more information.
1. Open a pull request with the proposed changes.
