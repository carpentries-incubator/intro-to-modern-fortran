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

Fortran files are plain text and can be edited with any plain text editor.
We recommend you use an editor that is capable of ***syntax highlighting***.
Setup instructions for some editors are available below.

Editor Setup Quick Links:

- [Emacs](#emacs)
- [VS Code](#vs-code)

### Emacs

[Emacs][emacs-link] is a cross-platform text editor available for Linux, macOS, and Windows.
Emacs applies syntax highlighting for most Fortran files.
Emacs ***f90-mode*** mode lets you tab complete Fortran statements.
It also adds a drop-down menu providing additional Fortran-related options.

Fortran files with different extensions, such as `.X90`, will not be picked up in this mode.
Files can be manually set to ***f90-mode*** using `M-x f90-mode`.
File extensions can be added to your [Emacs initialization file][emacs-init-link]
so they are recognised as Fortran when opened.
To add this to your initialisation file:

```lisp
(setq auto-mode-alist
      (append '(("\\.mf90" . f90-mode)
                ("\\.X90" . f90-mode)
        ) auto-mode-alist))
```

::::::::::::::::: tab

### Windows and macOS

From your home directory, initialization settings are placed in your `.emacs.d/init.el` file.

### Linux

Initialization settings are placed in your `~/.config/emacs/init.el` file.
This location follows the Linux desktop environment guidelines.

### Legacy (cross platform)

The `.emacs` or `.emacs.el` file is an older method of configuring Emacs.
This file is stored in your home directory.

:::::::::::::::::::::::::

### VS Code

[Visual Studio Code (VS Code)][vscode-link] is another powerful cross-platform IDE.
To use VS Code with Fortran we recommend two additions:

- The [Modern Fortran extension][vscode-modern-fortran] provides syntax highlighting,
  IntelliSense for Fortran statements, and debugging capabilities.
  It also adds customization options to improve the coding experience for Fortran developers.
- The Modern Fortran extension depends on `fortls`: a language server that interfaces VS Code.

`fortls` must be installed before the Modern Fortran extension.

::::::::::::::::: tab

### PyPI

```bash
$ pip install fortls
```

### Anaconda

```bash
$ conda install -c conda-forge fortls
```

### Brew

```bash
$ brew install fortls
```

### Source

The development version of `fortls` can be installed from GitHub:

```bash
$ pip install --user --upgrade git+git://github.com/fortran-lang/fortls
```

:::::::::::::::::::::::::

Once `fortls` is installed, install the [Modern Fortran extension][vscode-modern-fortran].

#### Adding a ruler

We recommend adding a ruler.
This is a vertical line in the editor after a set number of characters.
Rulers help avoid long lines that are hard to read.

To add a ruler at 80 characters:

1. Open the Command Palette (Press `Cmd+Shift+P`, or `Ctrl+Shift+P`)
2. Type 'settings'. Then select the option which says "Preferences: Open User Settings (JSON)"
3. This will open the `settings.json` file in your editor.
4. Add the `editor.rulers` property to the JSON file, e.g.

```json
{
    other.settings: "already here",
    editor.rulers: [80]
}
```

Save the file.
You should see a vertical line appear in your editor.
