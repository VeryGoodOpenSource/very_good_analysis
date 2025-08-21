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

## Add or remove rules

If you intend to provide changes related to a add or remove rules you can follow these steps:

1. Run `dart tool/bump_version/main.dart <NEW_VERSION>` to generate a new version.
   - Choose `<NEW_VERSION>` according to [Semantic Versioning](https://semver.org/) guidelines based on your proposed changes.
1. Add or remove the lint rules you want to change in the version file you generated in step 1. 
1. Document the rules that were removed with a reason as to why, if there is any.
   - Link to an issue as to why a lint rule should not be used if there is any.
1. Create a pull request following the guidelines in the [Creating a Pull Request](#creating-a-pull-request) section below.


## Contributing rules from a new Dart version

If you intend to provide changes related to a **new Dart version** you can follow these steps:

1. Ensure you are on the latest stable Dart version.
1. Run `dart tool/bump_version/main.dart <NEW_VERSION>` to generate a new version.
    - Choose `<NEW_VERSION>` according to [Semantic Versioning](https://semver.org/) guidelines based on your proposed changes.
1. Add or remove the lint rules you want to change in the version file you generated in step 2. 
    - To find new rules more easily you can run the same command as in step 4 which will add new rules directly to the exclusion table.
1.  Open a terminal in `tool/linter_rules` and run `dart lib/exclusion_reason_table.dart` to generate an up-to-date exclusion table.
1. Document the rules that were removed with a reason as to why, if there is any.
   - Link to an issue as to why a lint rule should not be used if there is any.
1. Create a pull request following the guidelines in the [Creating a Pull Request](#creating-a-pull-request) section below.

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
1. Follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0) specification for your commit messages.
   - This enables automatic version bumping and changelog generation as detailed in the [Release Process](#release-process) section.
1. Create the Pull Request.
1. Verify that all status checks are passing.


While the prerequisites above must be satisfied prior to having your
pull request reviewed, the reviewer(s) may ask you to complete additional
design work, tests, or other changes before your pull request can be ultimately
accepted.


## Release Process 🚀

  ##### ‼️ Important
  - Every snapshot of a version is saved on its own yaml file under the name pattern: `lib/analysis_options.<version>.yaml`.


We use [`release-please-action`][release-please-action-link] to automate versioning and changelog generation, along with a GitHub workflow that automatically publish the Very Good Analysis to pub.dev.

### How it works:

- 📌 **On Every Commit to main:**
    - Commits are analyzed using [Conventional Commits][conventional_commits_link].
    - If a version bump is needed, a **release PR** is automatically created or updated by [`release-please-action`][release-please-action-link].
    - The **release PR** includes:
        - An updated `CHANGELOG.md`
        - A version bump in `pubspec.yaml`

    ##### ‼️ Important
    - A version verification workflow (`.github/workflows/verify_version.yaml`) runs to ensure:
      - The version in `pubspec.yaml` matches the version in `lib/analysis_options.yaml`
      - The file `lib/analysis_options_<NEW_VERSION>.yaml` exists
      - If any mismatches are found, the files need to be manually updated to match

    ##### 💡 Notes

    - The GitHub Action workflow that automates the release process is configured in `.github/workflows/release_please.yaml`
    - release-please settings are defined in `.release-please-config.json` and `.release-please-manifest.json`
    - The release PR can be manually edited before merging.
    - The release PR should be merged **ONLY** when a new release is needed.

<br />

- ✅ **When the Release PR Is Merged:**
    - A new Git tag is created.
    - A GitHub Release is published with the changelog.
    - A new version of Very Good Analysis is automatically published in pub.dev.

    #### 💡 Notes

    - The publishing process is automatically triggered when a version tag is created.
    - The automated publishing workflow to pub.dev is defined in `.github/workflows/pub_publish.yaml`

<br />

This document provides a good summary of how it works and how we use it, but we recommend that you also read the official documentation of [Conventional Commits][conventional_commits_link], [Semantic Versioning][sem_ver_link], [Publishing Dart packages][dart_publishing_link] and [`release-please-action`][release-please-action-link].

[dart_publishing_link]: https://dart.dev/tools/pub/publishing
[sem_ver_link]: https://semver.org/
[release-please-action-link]: https://github.com/googleapis/release-please-action
[conventional_commits_link]: https://www.conventionalcommits.org/en/v1.0.0
[bug_report_link]: https://github.com/VeryGoodOpenSource/very_good_cli/issues/new?assignees=&labels=bug&template=bug_report.md&title=fix%3A+
[very_good_core_link]: doc/very_good_core.md
[very_good_ventures_link]: https://verygood.ventures/?utm_source=github&utm_medium=banner&utm_campaign=CLI
