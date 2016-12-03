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

@test "prints tasks from one day ago" {
  date=$(determineDate 1d)
  text="Text from yesterday."

  echo $text > "$TASK_DIRECTORY/$date.txt"

  run ./task 1d

  assert_success
  assert_line "$text"
}

@test "prints tasks from one week ago" {
  date=$(determineDate 1w)
  text="Task from last week."

  echo $text > "$TASK_DIRECTORY/$date.txt"

  run ./task 1w

  assert_success
  assert_line "$text"
}

@test "handles task file missing" {
  date="$(determineDate 1y)"

  run ./task 1y

  assert_success
  assert_line "No tasks on $date."
}
