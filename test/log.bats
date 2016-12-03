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

@test "log a single task" {
  date=$(date +%Y-%m-%d)
  task="Write a task tracker."

  run ./task $task

  assert_success
  assert_exists "$TASK_DIRECTORY/$date.txt"
  assert_log $date $task
  assert_lines $date 1
}

@test "log multiple tasks" {
  date=$(date +%Y-%m-%d)
  task1="Write a task tracker."
  task2="Release the task tracker."

  run ./task $task1

  assert_success
  assert_exists "$TASK_DIRECTORY/$date.txt"
  assert_log $date $task1
  assert_lines $date 1

  run ./task $task2

  assert_success
  assert_exists "$TASK_DIRECTORY/$date.txt"
  assert_log $date $task1
  assert_log $date $task2
  assert_lines $date 2
}
