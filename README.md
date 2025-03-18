# Pre-Commit Buildkite Plugin

A plugin to run [pre-commit](https://pre-commit.com/) as part of a Buildkite pipeline.

By default `pre-commit` will run for files changed in a Pull Request for Pull Requests otherwise on all files.
This can be overridden with the `all` parameter, causing all files to be checked on Pull Request runs.

## Requirements

`pre-commit` is expected to be installed on your Buildkite worker.

## Usage

Add the following to your `pipeline.yml`:
<!--x-release-please-start-version-->
```yaml
steps:
  - label: pre-commit
    plugins:
      - opzkit/pre-commit#v1.0.0
```

Or to run on all files even on PRs:

```yaml
steps:
  - label: pre-commit
    plugins:
      - opzkit/pre-commit#v1.0.0:
        all: true
```
<!-- x-release-please-end-->
