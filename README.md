# JMeter Test Plans

This is a collection of test plans designed to be run through [Apache JMeter](https://jmeter.apache.org/).

## Installation

You will need to install JMeter 5.0 to run these test plans.

See the [official documentation](https://jmeter.apache.org/usermanual/get-started.html#install) to install JMeter.

## Running Test Plans

Test plans should be run from the CLI rather than the GUI for more accurate results. To execute a test plan via CLI, for example the Replay Logs plan:
```
jmeter -n -t replay_logs/replay_logs.jmx -j replay_logs/output/jmeter.log
```

## Available Test Plans

- `replay_logs`: Replay a selection of Apache access logs at roughly the same rate.
  - Logs will be replayed against the URL set in the Server Name or IP field of the `${url}` sampler. More simultaneous users can be added to the thread group to simulate heavier traffic.
  - Access log files must be processed to a CSV. Copy the access log file to `input/input.log`, run `utils/process_apache_log.rb`, and `input/input.csv` will be generated for use with the test plan.
  - Results will be saved to the `output` directory.
