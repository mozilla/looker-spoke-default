# Sync Dashboards

A simple script that links and sync user-defined dashboards with LookML dashboards.

## Usage

### `sync`

`main.py sync --config ../../lookml_dashboards.yaml`

* Updates user-defined dashboards `lookml_link_id` references to the  config definition.
* Unlinks any user-defined dashboards that are not defined in the config, if the linked LookML dashboard is present in the config.
* Executes sync to sync content from LookML dashboards to linked user-defined dashboards.

### `current-mappings`

`main.py current-mappings`

* Returns all user-defined dashboards on the looker instance that have a `lookml_link_id` set.
