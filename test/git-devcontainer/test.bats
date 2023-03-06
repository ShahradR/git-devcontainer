#!/usr/bin/env bats

setup() {
    load '../test_helper/bats-support/load'
    load '../test_helper/bats-assert/load'

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "Verify that Vim has been installed" {
  run bash -c "which vim"
  assert_output '/usr/bin/vim'
}

@test "Verify that Python 3 has been installed" {
  run bash -c "which python3"
  assert_output '/usr/local/python/current/bin/python3'
}

@test "Verify that PyPI 3 has been installed" {
  run bash -c "which pip3"
  assert_output '/usr/local/python/current/bin/pip3'
}

@test "Verify that Git has been installed" {
  run bash -c "which git"
  assert_output '/usr/local/bin/git'
}

@test "Verify that detect-secrets has been installed" {
  run bash -c "which detect-secrets"
  assert_output '/usr/local/bin/detect-secrets'
}

@test "Verify that pre-commit has been installed" {
  run bash -c "which pre-commit"
  assert_output '/usr/local/bin/pre-commit'
}

@test "Verify that Node.JS has been installed" {
  run bash -c "which node"
  assert_output '/usr/local/share/nvm/versions/node/v16.19.1/bin/node'
}

@test "Verify that npm has been installed" {
  run bash -c "which npm"
  assert_output '/usr/local/share/nvm/versions/node/v16.19.1/bin/npm'
}

@test "Verify that the GitHub CLI has been installed" {
  run bash -c "which gh"
  assert_output '/usr/bin/gh'
}

@test "Verify that Docker is available" {
  run bash -c "which docker"
  assert_output '/usr/bin/docker'
}
