# MariaDB Plugin Foundry

It's used to produce packages (tar.gz, rpm, deb are supported) of all or some registered plugins.

Requires `MariaDB-devel` or `libmariadb-dev` package to be installed.
Or if `CMAKE_PREFIX_PATH` and `LIBRARY_PATH` are set accordingly in the
environment, could be run with the binary tarball or the server build tree.

Use as

```
mkdir build
cd build
cmake -P /path/to/foundry/run.cmake /path/to/foundry/*
```
can be run in-tree too
```
cmake -P run.cmake *
```
Building an rpm package for just one plugin:
```
cmake -DRPM=1 -P run.cmake tidesql
```

It's not designed for plugin development, incremental builds and rebuilds — use plugin sources directly for that.
