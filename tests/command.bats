# To debug stubs, uncomment these lines:
# export CP_DUMMY_STUB_DEBUG=/dev/tty

setup() {
  load "${BATS_PLUGIN_PATH}/load.bash"
}

@test 'Run for all files for non PR' {
  stub pre-commit \
    "run -a : exit 0"
  run "${PWD}/hooks/command"

  unstub pre-commit
  assert_success
}

@test 'Run for all files for PR when flag set' {
  export BUILDKITE_PLUGIN_PRE_COMMIT_ALL=true
  stub pre-commit \
    "run -a : exit 0"
  run "${PWD}/hooks/command"

  unstub pre-commit
  assert_success
}

@test 'Run for changed files on PR' {
  export BUILDKITE_PULL_REQUEST=true
  export BUILDKITE_PULL_REQUEST_BASE_BRANCH=main

  stub git \
    "fetch origin main:main : exit 0"

  stub pre-commit \
    "run --from-ref main --to-ref HEAD --show-diff-on-failure : exit 0"
  run "${PWD}/hooks/command"

  unstub pre-commit
  unstub git
  assert_success
}
