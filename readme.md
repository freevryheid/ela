# Elastic Layer Analysis (ela)

Some old fortran code that calculates stresses, strain and deflections in
elastic layered media using Burmister's approach.

The meson project compiles the code to a static library and a c wrapper is used
to compile a shared library that can be linked against c, vala, python,
etc.

## Compiling

Check the meson.build file.

```
meson setup -Dauto_features=disabled --buildtype release build

```

then cd into the build folder and run

```
meson compile

```

## Python

A wrapper and jupyter notebook is provided.









