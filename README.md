# go-plugin-compiler-action

Github Action will build a go plugin for a given gateway version

## Inputs
### `gw_tag`
**Required** The github tree-ish (commit, tag, branch) that the plugin should be built for

The default is the latest released LTS version which is currently `v3.0.1`

### `plugin_name`
**Required** The name of the output shared library

Due to the implementation of the plugin compiler, this cannot be a pathname, just a file name.

### `plugin_source_path`
The subdirectory that the plugin source is in with a trailing /. Defaults to the root of the repo.

## Outputs
None. The plugin is availble in the workspace root for further processing.

## Minimal example

``` yaml
- uses: TykTechnologies/go-plugin-compiler-action@v1.1
  with:
    gw_tag: v3.1.1
    plugin_name: my-plugin.so
```

## Fuller example

``` yaml
name: Build

on:
  push:
    branches:
      - main

jobs:
  ddb:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
        
      - uses: TykTechnologies/go-plugin-compiler-action@main
        with:
          gw_tag: v3.1.1
          name: basicauth-ddb.so

```

This workflow will leave basicauth.ddb.so in the workspace root. Which you can use further. See https://github.com/alephnull/tyk-dynamodbauth for an actual example.
