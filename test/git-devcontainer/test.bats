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
  run bash -c "vim --version"
  assert_output --partial 'VIM - Vi IMproved 8.2'
}

@test "Verify that Python 3 has been installed" {
  run bash -c "python3 --version"
  assert_output 'Python 3.10.9'
}

@test "Verify that PyPI 3 has been installed" {
  run bash -c "pip3 --version"
  assert_output --partial 'pip 23.0'
}

@test "Verify that Git has been installed" {
  run bash -c "git --version"
  assert_output 'git version 2.39.1'
}

@test "Verify that detect-secrets has been installed" {
  run bash -c "detect-secrets --version"
  assert_output '1.4.0'
}

@test "Verify that pre-commit has been installed" {
  run bash -c "pre-commit --version"
  assert_output 'pre-commit 3.0.4'
}

@test "Verify that Node.JS has been installed" {
  run bash -c "node --version"
  assert_output 'v16.19.0'
}

@test "Verify that npm has been installed" {
  run bash -c "npm --version"
  assert_output '8.19.3'
}

@test "Verify that the GitHub CLI has been installed" {
  run bash -c "gh --version"
  assert_output --partial 'gh version 2.22.1'
}

@test "Verify that Docker is available" {
  run bash -c "docker --version"
  assert_output --partial 'Docker version 20.10.22'
}
