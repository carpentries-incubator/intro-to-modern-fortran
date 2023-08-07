---
title: Setup
---

## Data Sets

Download the [zip file](https://github.com/astroDimitrios/intro-to-modern-fortran) and unzip it to your Desktop or check out this [git repository]().
This file contains data and skeleton code which we will use throughout the course.

## Software Setup

::::::::::::::::::::::::::::::::::::::: discussion

### Details

Before the start of the course please ensure that you have access to a Fortran compiler, and if necessary an account on *archer2*.

:::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::: solution

### archer2

For details of how to log into an archer2 account, see [archer2 quickstart guide link](https://docs.archer2.ac.uk/quick-start/quickstart-users/).

The default Fortran compiler on archer2 is the Cray Fortran compiler invoked using `ftn`. For example,

```shell
$ cd section1.01
$ ftn example1.f90
```

should generate an executable with the default name `a.out`.

:::::::::::::::::::::::::

:::::::::::::::: solution

### GFortran

If you are not taking this course on archer2 we recommend installing the [GFortran][install-gfortran] compiler.

:::::::::::::::::::::::::



