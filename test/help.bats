#!./libs/bats/bin/bats

load "libs/bats-support/load"
load "libs/bats-assert/load"

@test "prints help" {
  run ./task --help

  assert_success
  assert_line "Usage:"
}
