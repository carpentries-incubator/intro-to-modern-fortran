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

While Fortran files are plain text and can be edited with any plain text editor, it is recommened that you use an editor that is capable of _syntax highlighting_. Setup instructions for some editors are available below.

### Emacs

[Emacs][emacs-link] is a cross-platform text editor available for Linux, MacOS, and Windows. Emacs applies syntax highlighting for most Fortran files, but additional file extensions, such as `.X90`  may be valid Fortran files but will not be picked up in Emacs _f90-mode_. This mode allows for tab-completion of Fortran statements and the addition of a drop-down menu that provides additional Fortran-related options.

Files can be manually set to f90-mode using `M-x f90-mode`, but file extensions can be added to your [Emacs initialization file][emacs-init-link] to ensure that these are recognised when opened. The format for this is
```lisp
(setq auto-mode-alist
      (append '(("\\.mf90" . f90-mode)
                ("\\.X90" . f90-mode)
        ) auto-mode-alist))
```
::::::::::::::::: tab

### Windows/MacOS

From your home directory, initialization settings can be placed within your `.emacs.d/init.el` file.

### Linux

Initialization settings can be placed within your `~/.config/emacs/init.el` file. This location follows the Linux desktop environment guidelines.

### Legacy (cross platform)

The `.emacs` or `.emacs.el` file is an older method of configuring Emacs. This file is held in your home directory.

:::::::::::::::::::::::::

### VS Code

[Visual Studio Code (VS Code)][vscode-link] is a powerful IDE available for Linux, macOS, and Windows. To bring the power of VS Code to bear on Fortran, two additions are required. The [Modern Fortran extension](vscode-modern-fortran) enhances Fortran support in VS Code, offering features such as syntax highlighting, IntelliSense for Fortran statements, and debugging capabilities, along with customization options to improve the coding experience for Fortran developers. The Modern Fortran extension depends on `fortls`: a language server that interfaces with the code editor.

::::::::::::::::: tab

### PyPI

```bash
pip install fortls
```

### Anaconda

```bash
conda install -c conda-forge fortls
```

### Brew

```bash
brew install fortls
```

### Source

The development version of `fortls` can be installed from GitHub via

```bash
pip install --user --upgrade git+git://github.com/fortran-lang/fortls
```

:::::::::::::::::::::::::

Once `fortls` is installed, install the [Modern Fortran extension](vscode-modern-fortran), and it should work out of the box.

#### Adding a ruler

We recommend adding a ruler: essentially a vertical line in the editor which gives you a visual guide as to the number of characters you should include on a single line of code. 

To add a ruler at 80 characters to your VS Code editor window, in VS Code

1. Open the Command Palette (Press `Cmd+Shift+P`, or `Ctrl+Shift+P`)
2. Type 'settings' and then select the option which says "Preferences: Open User Settings (JSON)"
3. This should open the `settings.json` file in your editor. It may already have code in it.
4. Add the `editor.rulers` property to the JSON file, e.g.

```json
{
    other.settings: "already here",
    editor.rulers: [80]
}
```

If you save the file, you should immediately see a vertical line appear in your editor.