setupTaskEnvironment() {
  export TASK_DIRECTORY="$(mktemp -d)"
}

teardownTaskEnvironment() {
  if [ $BATS_TEST_COMPLETED ]; then
    rm -rf $TASK_DIRECTORY
  else
    echo "** Did not delete $TASK_DIRECTORY, as test failed **"
  fi
}

assert_exists() {
  assert [ -f "$1" ]
}

assert_lines() {
  date=$1
  actual=$(cat "$TASK_DIRECTORY/$date.txt" | wc -l)
  expected=$2

  assert_equal $expected $actual
}

assert_log() {
  date=$1
  text=${@:2}

  grep "$text" "$TASK_DIRECTORY/$date.txt"
}
