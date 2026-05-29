---
name: bump-version
description: >
  Bumps the very_good_analysis package to a new version. Use when preparing a
  release, adding support for a new Dart SDK, or adding/removing lint rules —
  even for phrasings like "bump version", "cut a release", or "add rules for
  Dart X.Y".
---

# Bump Version — very_good_analysis

## Overview

This skill guides the full version bump workflow for the `very_good_analysis`
package. It uses the project's own `tool/bump_version` Dart script and enforces
the constraints from the project's release process.

## Key Constraints

> These rules are critical. Violating some of them will cause CI to fail.

1. **`pubspec.yaml` version is NOT bumped here.** The version in `pubspec.yaml`
   is managed exclusively by `release-please`. Do not change it.
2. **`lib/analysis_options.yaml` MUST point to the new version.** The
   `bump_version` tool handles this automatically.
3. **A new `lib/analysis_options.<version>.yaml` MUST exist.** The
   `bump_version` tool creates it by copying the previous version's file.
4. **The `latest_vga_version_test.dart` expected version MUST match** the
   version referenced in `lib/analysis_options.yaml`.
5. **The `tool/linter_rules` tests must pass** — they validate the consistency
   of the linter rules tooling.
6. **All changes go on a feature branch**, never directly on `main`.
7. **Commit messages must follow Conventional Commits** (e.g. `feat:`, `fix:`).

## Inputs

| Parameter | Description                                          | Required            |
| --------- | ---------------------------------------------------- | ------------------- |
| `version` | New version string in `x.y.z` format (e.g. `10.4.0`) | Ask if not provided |

If `version` is not provided, ask:

> "What version do you want to bump to? (e.g. `10.4.0`)"

Validate the format matches `\d+\.\d+\.\d+` before proceeding.

## Workflow

### Step 1 — Confirm the version

- If the user provided a version, confirm it looks correct.
- Validate it is greater than the current version in `lib/analysis_options.yaml`
  (read it with the Dart MCP `read_package_uris` tool or the `Read` file tool).

### Step 2 — Run the bump_version tool

Run from the **project root**:

```sh
dart tool/bump_version/lib/bump_version.dart <NEW_VERSION>
```

This will:

- Copy `lib/analysis_options.<current>.yaml` → `lib/analysis_options.<new>.yaml`
- Update `lib/analysis_options.yaml` to `include:` the new versioned file

> Do NOT manually edit `lib/analysis_options.yaml` or create the versioned
> file by hand. Always use the tool.

### Step 3 — Update the linter rules test

The file `tool/linter_rules/test/src/latest_vga_version_test.dart` contains a
hardcoded expected version:

```dart
expect(version, equals('<CURRENT_VERSION>'));
```

Update it to match `<NEW_VERSION>`. This test reads `lib/analysis_options.yaml`
at runtime, so it must stay in sync.

### Step 4 — (Optional) Update lint rules in the new file

If the purpose of the bump is to add/remove rules or incorporate new Dart SDK
rules, edit `lib/analysis_options.<NEW_VERSION>.yaml` now.

For new Dart SDK rules, also run the exclusion reason table generator. Fetch
the tool's dependencies first, since `tool/linter_rules` is a separate package
with its own `pubspec.yaml`:

```sh
# From tool/linter_rules directory
dart pub get
dart lib/exclusion_reason_table.dart
```

### Step 5 — Verify with static analysis

Prefer the **Dart MCP `analyze_files` tool** if available. Otherwise use the
CLI:

```sh
# From project root
dart analyze lib example
dart format --set-exit-if-changed lib example
```

The `ci` workflow only analyzes `lib` and `example`, but this workflow also
edits `tool/linter_rules/test/src/latest_vga_version_test.dart`. That directory
is validated by a separate CI workflow (`tool_linter_rules.yaml`), so verify it
locally too:

```sh
# From tool/linter_rules directory
dart pub get
dart format --set-exit-if-changed .
dart analyze .
```

### Step 6 — Run the linter_rules tool tests

Prefer the **Dart MCP tools** if available. Otherwise (skip `dart pub get` if
you already ran it in a previous step):

```sh
# From tool/linter_rules directory
dart pub get
dart test
```

All tests must pass, including:

- `latestVgaVersion returns the latest very good analysis version`
- All other tests in `tool/linter_rules/test/`

### Step 7 — Understand `verify_version` (do NOT run it here)

> Do not run `tool/verify_version/main.dart` as part of this workflow. It will
> fail by design, and that failure is meaningless at this stage.

The `verify_version` script compares the `pubspec.yaml` version against the
version referenced in `lib/analysis_options.yaml`. In this workflow `pubspec.yaml`
is intentionally NOT bumped (it stays behind, managed by `release-please`), so
the two versions will not match and the script will exit with code `1`.

The CI `verify_version` workflow reflects this: it is gated to run **only** on
the release-please branch
(`release-please--branches--main--components--very_good_analysis`). It passes
only after `release-please` opens its release PR and bumps `pubspec.yaml` to
match. There is nothing to verify locally during the feature PR.

### Step 8 — Commit

Stage only the relevant files:

```
lib/analysis_options.yaml
lib/analysis_options.<NEW_VERSION>.yaml
tool/linter_rules/test/src/latest_vga_version_test.dart
```

Do NOT stage `pubspec.yaml` unless the SDK constraint also needs updating
(e.g. when adopting a new Dart SDK version).

Commit message must follow Conventional Commits. Since PRs are squash-merged,
the commit subject and the PR title end up being the same thing — so keep them
consistent. Prefer the title that the `semantic-pull-request` check expects (see
Step 9):

- Upgrading to a new Dart SDK → `feat: upgrade to Dart <NEW_SDK_VERSION>`
- Adding/removing lint rules (no SDK change) → `feat: add analysis_options.<version>.yaml`
- Bug fix in rules → `fix: update analysis_options.<version>.yaml`

### Step 9 — Push and open PR

Push to the feature branch and open a PR against `main`.

**PR title** must follow Conventional Commits to satisfy the
`semantic-pull-request` CI check, and should match the commit subject from
Step 8 (PRs are squash-merged):

- When the bump tracks a new Dart SDK (the common case):
  ```
  feat: upgrade to Dart <NEW_SDK_VERSION>
  ```
  where `<NEW_SDK_VERSION>` is the Dart SDK version associated with the
  `very_good_analysis` version being added (e.g. `feat: upgrade to Dart 3.9`).
- When the bump only adds/removes lint rules with no SDK change:
  ```
  feat: add analysis_options.<NEW_VERSION>.yaml
  ```

**PR description** — before opening the PR, search the GitHub repo
`VeryGoodOpenSource/very_good_analysis` for an open issue requesting this bump
(typically titled something like
`feat: add analysis_options.<NEW_VERSION>.yaml for Dart <NEW_SDK_VERSION>`).

Use the GitHub MCP server's issue search tool (its exact name depends on your
environment — e.g. `search_issues`) with a query like:
`repo:VeryGoodOpenSource/very_good_analysis analysis_options.<NEW_VERSION>.yaml`

If the GitHub MCP tools are unavailable, fall back to the CLI:
`gh issue list --repo VeryGoodOpenSource/very_good_analysis --search "analysis_options.<NEW_VERSION>.yaml"`

If a matching issue is found, append the following line to the PR description:

```
Closes #<ISSUE_NUMBER>.
```

If no matching issue exists, omit the closing line.

## File Map

| File                                                      | Role                                                                                |
| --------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `lib/analysis_options.yaml`                               | Default include — always points to latest versioned file                            |
| `lib/analysis_options.<version>.yaml`                     | Versioned snapshot of all lint rules                                                |
| `pubspec.yaml`                                            | Package version — managed by `release-please`, do NOT bump manually                 |
| `tool/bump_version/lib/bump_version.dart`                 | Script that creates the new versioned file and updates the default                  |
| `tool/linter_rules/test/src/latest_vga_version_test.dart` | Must match the version in `lib/analysis_options.yaml`                               |
| `tool/linter_rules/lib/exclusion_reason_table.dart`       | Regenerates the exclusion table (run when adding new SDK rules)                     |
| `tool/verify_version/main.dart`                           | Verifies pubspec version matches analysis_options version (release-please PRs only) |

## Release Process (for context)

This skill prepares the **feature PR**. The release itself is automated:

1. Feature PR is merged to `main` with a `feat:` commit.
2. `release-please` detects the conventional commit and opens a **release PR**
   (titled `chore: <version>`, per `.release-please-config.json`) that bumps
   `pubspec.yaml` and updates `CHANGELOG.md`.
3. When the release PR is merged, a tag is created and the package is published
   to pub.dev automatically.

> Never bump `pubspec.yaml` manually. Let `release-please` do it.

## Example Session

```
User: bump version to 10.4.0

Agent:
1. Reads lib/analysis_options.yaml → current version is 10.3.0 ✓
2. Runs: dart tool/bump_version/lib/bump_version.dart 10.4.0
   → Creates lib/analysis_options.10.4.0.yaml
   → Updates lib/analysis_options.yaml to include 10.4.0
3. Updates latest_vga_version_test.dart: expects('10.4.0')
4. Runs dart analyze/format on lib example AND tool/linter_rules → clean ✓
5. Runs dart pub get + dart test in tool/linter_rules → all pass ✓
   (Skips tool/verify_version — it fails by design until release-please runs)
6. Commits (subject matches the PR title, since PRs squash-merge):
   feat: upgrade to Dart 3.13
7. Searches GitHub for an issue matching
   "feat: add analysis_options.10.4.0.yaml for Dart 3.13"
   → Found issue #673 ✓
8. Pushes and opens PR:
   Title: feat: upgrade to Dart 3.13
   Body:  ...
          Closes #673.
```
