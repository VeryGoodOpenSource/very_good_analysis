# very_good_analysis

This repo publishes [very_good_analysis](https://pub.dev/packages/very_good_analysis) — the lint ruleset used at Very Good Ventures.

## Architecture

- **`lib/`** contains versioned YAML files: `analysis_options.<version>.yaml`.  
  `lib/analysis_options.yaml` always includes the latest versioned file (a single `include:` directive).
- **`lib/very_good_analysis.dart`** is an empty library declaration (the package ships config files, not Dart code).
- **Three tool sub-packages** under `tool/`:
  - `tool/linter_rules/` — tools to maintain rules: regenerates the exclusion table, detects/removes deprecated rules, analyzes coverage vs. all Dart linter rules.
  - `tool/bump_version/` — copies the latest versioned YAML to a new version and updates `lib/analysis_options.yaml`.
  - `tool/verify_version/` — single script that checks `pubspec.yaml` version matches the version in `lib/analysis_options.yaml`.
- **`example/`** is a separate package that depends on and uses the analysis options (verifies they work).

## Development commands

Run everything from the **project root** unless noted otherwise.

```sh
dart pub get                                      # install deps
dart format --set-exit-if-changed lib example     # format check (CI enforces this)
dart analyze lib example                          # static analysis (CI enforces this)
```

### Bumping the version

```sh
dart tool/bump_version/lib/bump_version.dart <x.y.z>
```

This copies the latest versioned YAML to `lib/analysis_options.<x.y.z>.yaml` and updates `lib/analysis_options.yaml` to point to it. You must then edit the new file to add/remove rules.

### Version verification (CI check)

```sh
dart run tool/verify_version/main.dart
```

Fails if `pubspec.yaml` version ≠ `lib/analysis_options.yaml` include target, or if `lib/analysis_options.<version>.yaml` doesn't exist.

### Linter rules tooling (from `tool/linter_rules/`)

```sh
cd tool/linter_rules
dart pub get                                     # separate deps
dart lib/exclusion_reason_table.dart             # regenerate the excluded-rules table in README.md
dart bin/analyze.dart                            # compare VGA ruleset against all Dart linter rules
dart bin/remove_deprecated_rules.dart            # remove deprecated rules, bump to new minor version
dart test                                        # run unit tests for this tool
```

## CI / Release

| Workflow                 | Trigger                            | What it does                                                                                                             |
| ------------------------ | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `main.yaml`              | PR                                 | `dart pub get` → `dart format --set-exit-if-changed lib example` → `dart analyze lib example` + semantic PR check + pana |
| `verify_version.yaml`    | PR from release-please branch      | Runs `dart run tool/verify_version/main.dart`                                                                            |
| `tool_linter_rules.yaml` | PR touching `tool/linter_rules/**` | Runs tests + analysis for the linter_rules tool                                                                          |
| `release_please.yaml`    | Push to `main`                     | Creates/updates a release PR with version bump + changelog                                                               |
| `pub_publish.yaml`       | Push tag `v*`                      | `dart pub publish --dry-run` then `dart pub publish --force` (OIDC auth)                                                 |
| `bot_updater.yaml`       | Schedule (weekdays)                | Checks for new/removed linter rules, opens PRs                                                                           |

## Conventions

- **Commit messages must follow Conventional Commits** (enforced by semantic PR check). Format: `type: description` where type is one of `feat`, `fix`, `refactor`, `chore`, `docs`, etc.
- **Every version snapshot is saved permanently** as `lib/analysis_options.<version>.yaml`. Never delete old version files.
- **pubspec.yaml version must match the YAML include version** at all times. If they diverge, run `bump_version.dart`.
- **`dart format .` and `dart analyze . --fatal-infos`** must pass before opening a PR (per CONTRIBUTING.md).
- Use Conventional Commits; release-please reads them to determine the next version.

## Testing quirks

- The root package has **no test directory** — it ships YAML config, not Dart code.
- Tests live in `tool/linter_rules/test/`. Run them with `dart test` from `tool/linter_rules/`.
- 100% test coverage is expected for contributions (stated in CONTRIBUTING.md).
- `pubspec.lock` is gitignored at the root but NOT in `tool/` or `example/` sub-packages.

## Package structure notes

- `tool/**` is excluded from the published package via `.pubignore`.
- The root `analysis_options.yaml` simply includes `lib/analysis_options.yaml` (self-application).
- Dart SDK is pinned to `3.12.0` in all CI workflows.
