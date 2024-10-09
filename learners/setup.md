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

## Text Editors and Integrated Development Environments (IDEs)

While Fortran files are plain text can could be edited with any plain text editor, it is recommened that you use an editor that is capable of _syntax highlighting_. There are a number of these available.

### Emacs

[Emacs](https://www.gnu.org/software/emacs/) is a cross-platform text editor available for Linux, MacOS, and Windows. It will contain syntax highlighting for many Fortran file, but additional file extensions, such as `.X90`  may be valid Fortran files but will not be picked up in Emacs _fortran-mode_ or _f90-mode_. These modes allow for tab-completion of Fortran statements and the addition of an drop-down menu that provides additional Fortran-related options.

Files can be manually set to fortran-mode or f90-mode using `M-x fortran-mode` or `M-x f90-mode`, but file extensions can be added to your Emacs configuration file to ensure that these are recognised when opened. The format for this is

```lisp
(setq auto-mode-alist
      (append '(("\\.mf77$" . fortran-mode)
                ("\\.mh$" . fortran-mode)
                ("\\.X90" . f90-mode)
                ("\\.mf90" . f90-mode)
        ) auto-mode-alist))
```

