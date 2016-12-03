#!./libs/bats/bin/bats

load "libs/bats-support/load"
load "libs/bats-assert/load"
load "helpers"

setup() {
  setupTaskEnvironment
}

teardown() {
  teardownTaskEnvironment
}

@test "prints tasks from today" {
  date=$(date -j +"%Y-%m-%d")
  text="Task from today."

  echo $text > "$TASK_DIRECTORY/$date.txt"

  run ./task

  assert_success
  assert_line "$text"
}

@test "handles task file missing" {
  run ./task

  assert_success
  assert_line "No tasks yet."
}
