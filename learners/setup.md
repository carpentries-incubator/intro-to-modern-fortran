---
title: Setup
---

## Learning Outcomes

This course provides an introduction to writing Modern Fortran.
It covers everything from basic syntax and variables, to functions, arrays, and modules.
Common Fortran idioms will be introduced and compared to C++.

Within the first hour you will have:

- written a hello world program
- compiled your first program
- done basics maths in a program

At the end of the course you should be able to:

- understand many Fortran programs
- write well-structured Fortran
- write portable Fortran modules

Fortran is a rather "large" language,
so it is not possible to cover all its features in this course.
We focus on features used to write modern HPC code.
Other features you might encounter in legacy code are explained in spoilers:

::: spoiler

### Legacy Fortran

You will see spoilers like this in the lesson.
They contain features more commonly used in legacy code.
These spoilers explain why the feature
is not used often in modern code.

:::

The follow on lesson **Object Orientated Fortran**
(coming soon) contains further advanced topics.

## Data Sets

Download the [tar file](../episodes/data/exercises.tar.gz)
and extract the contents in your Desktop.
This file contains template code and data for some exercises.
It also contains solutions for all exercises.

```bash
$ mkdir ~/Desktop/intro-to-modern-fortran
$ cd ~/Desktop/intro-to-modern-fortran
$ tar -xzf ~/Downloads/exercises.tar.gz --strip-components=1
```

::: spoiler

### Alternative Download Method

If the tar file download fails, the exercises and data sets
are in this lessons GitHub repository:

```bash
$ cd ~/Desktop
$ git clone git@github.com:carpentries-incubator/intro-to-modern-fortran.git
```

The [tar file](https://github.com/carpentries-incubator/intro-to-modern-fortran/blob/main/exercises.tar.gz) is in the root directory.
Alternatively the exercises are in the top level `exercises/` directory.

:::

## Compiler Setup

Fortran is a compiled language.
You have to translate your Fortran code to machine code
before running the program.
We do this with a Fortran compiler.
You should test your code with multiple compilers,
as some are better at debugging certain errors than others.

### Installing a Compiler

Your instructor may provide different instructions for installing
a suitable compiler or have installed one for you.
If you need to install a compiler yourself follow the instructions below.
We recommend installing **GFortran** as your first compiler.

::: group-tab

### GFortran

GFortran is a free open source compiler.
It is part of the Gnu Compiler Collection (GCC).
Comprehensive installation instructions are on the
[GFortran install page on fortran-lang][install-gfortran].

You can also install GFortran via [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html):

```bash
$ conda install gfortran
```

### Intel

The Intel Fortran compiler is free through their oneAPI toolkit.
You can download only the compiler or
the oneAPI Fortran Essentials toolkit.

- [Compiler Only Install Instructions - Linux and Windows](https://www.intel.com/content/www/us/en/developer/tools/oneapi/fortran-compiler-download.html)
- [Linux oneAPI Fortran Essentials Install Instructions](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2025-0/intel-fortran-essentials.html#GUID-E8EA92E5-84BC-4550-9988-4A9147A1B769)
- [Windows oneAPI Fortran Essentials Install Instructions](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-windows/2025-0/intel-fortran-essentials.html)

Note: The Intel compiler is not available for macOS.

### Flang

LLVM Flang is another open source compiler
based on the LLVM compiler toolkit.
Flang is installed from the LLVM source code.
If you have not built programs from source before
we recommended choosing another compiler
or installing Flang via conda.
[Link to the Flang Getting Started page](https://flang.llvm.org/docs/GettingStarted.html)

### Cray

The [HPE Cray Fortran compiler](https://cpe.ext.hpe.com/docs/latest/cce/index.html)
is proprietary but highly optimised.
Your organisation may have a license for the Cray compiler.

:::

### Testing your compiler

Now you have a compiler installed you can compile a simple program.
The [exercise and data file](./setup.md#data-sets)
you downloaded contains `setup/hello_world.f90`.
This is a simple Fortran program:

```fortran
program hello_world

    implicit none

    print *, 'Hello world!'

end program hello_world

```

Enter the setup directory:

```bash
$ cd setup
$ ls
```

```output
hello_world.f90
```

To compile the program run:

::: group-tab

### GFortran

```bash
$ gfortran hello_world.f90
```

### Intel

```bash
$ ifx hello_world.f90
```

### Flang

```bash
$ flang hello_world.f90
```

### Cray

```bash
$ ftn hello_world.f90
```

:::

You should see a new file in the directory:

```bash
$ ls
```

```output
a.out hello_world.f90
```

The `a.out` file is your compiled program.
To run the program:

```bash
$ ./a.out
```

```output
Hello world!
```

You have compiled your first Fortran program!
The first episode in this lesson will
cover compiling in more detail.

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
