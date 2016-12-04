# task [![Build Status](https://api.travis-ci.org/tristandunn/task.svg?branch=master)](https://travis-ci.org/tristandunn/task)

A *really* simple command line task tracking tool.

## Installation

Download `task`, make it executable (`chmod +x task`), and place it in your
`$PATH`.

If you just want to copy and paste a command, this should work:

    TASK_URL=https://raw.githubusercontent.com/tristandunn/task/master/task &&
      curl $TASK_URL > /usr/local/bin/task &&
      chmod +x /usr/local/bin/task

## Configuration

By default your tasks live in `~/.tasks`. You can change to anywhere by setting
the `$TASK_DIRECTORY` environment variable.

## Usage

### `task`

Displays tasks from today, if any.

### `task <duration>`

Display tasks from a previous day based on the `duration`. The `duration` is
based on the `date` option `-v` and may be `[0-9]+(y|m|w|d|H|M|S)`.

```bash
# List tasks from yesterday.
task 1d

# List tasks from twelve weeks ago.
task 12w
```

### `task <description>`

Logs `description` as a task for today.

## Development

Initialize the modules for testing.

    git submodule update --init --recursive

Be sure to write and run the tests.

    ./test.sh

## License

task uses the MIT license. See LICENSE for more details.
