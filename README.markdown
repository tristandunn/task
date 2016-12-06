# task [![Build Status](https://api.travis-ci.org/tristandunn/task.svg?branch=master)](https://travis-ci.org/tristandunn/task)

A *really* simple command line task tracking tool.

## Installation

### Homebrew

    brew install tristandunn/formula/task

### cURL

```sh
TASK_URL=https://raw.githubusercontent.com/tristandunn/task/master/task &&
  curl $TASK_URL > /usr/local/bin/task &&
  chmod +x /usr/local/bin/task
```

### Manual

Download [task][], make it executable (`chmod +x task`), and place it in your
`$PATH`.

## Usage

### `task`

Displays tasks from today, if any.

#### Example

```sh
$ task
No tasks yet.
```

### `task <duration>`

Display tasks from a previous day based on the `duration`. The `duration` is
based on the `date` option `-v` and may be `[0-9]+(y|m|w|d|H|M|S)`.

#### Example

```sh
# List tasks from yesterday.
$ task 1d
Start writing a bash script.
Wonder why I am using bash to track tasks.

# List tasks from twelve weeks ago.
$ task 12w
No tasks on 2016-09-12.
```

### `task <description>`

Logs `description` as a task for today.

#### Example

```sh
$ task Write a task tracking tool.
```

## Development

Initialize the modules for testing.

    git submodule update --init --recursive

Be sure to write and run the tests.

    ./test.sh

## License

task uses the MIT license. See LICENSE for more details.




[task]: https://raw.githubusercontent.com/tristandunn/task/master/task
