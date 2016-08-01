# Rollbacker Smart Policy for [Trailbot](https://trailbot.io)
This [Trailbot Smart Policy](https://github.com/trailbot/client/wiki/Smart-Policies) rolls back modified files into their previous version.

## Use cases

### Logs integrity

Log files are designed to be append-only. Removal of individual lines from log files are a clear sign of someone trying to erase traces of illegitimate activity.
By adding this policy, you can revert your logs back to previous version in case of unauthorized modification.

## Parameters
This policy accepts the following parameters:

| Name   | Description                                                     | Default value | Required |
|--------|-----------------------------------------------------------------|---------------|------------|
| type | Revert only this type of modifications*  | 'Removal'        | :white_check_mark:|
| allowRotate | Absolute path of the folder where you want to store the backup. | true        | :white_check_mark:|

* In order to avoid crazy loops, you can set a rollbacker for addition or removal but never for both of them.
