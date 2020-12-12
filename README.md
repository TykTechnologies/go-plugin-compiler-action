# go-plugin-compiler-action

Github Action will build a go plugin for a given gateway version

## Inputs
### `gw_tag`
**Required** The github tree-ish (commit, tag, branch) that the plugin should be built for

The default is the latest released LTS version which is currently `v3.0.1`

### `plugin_name`
**Required** The name of the output shared library

Due to the implementation of the plugin compiler, this cannot be a pathname, just a file name.

## Outputs
None

## Example usage

``` yaml
uses: TykTechnologies/go-plugin-compiler-action@master
with:
  gw_tag: v3.1.1
  plugin_name: my-plugin.so
```
