---
title: Setup
---

## Learning Outcomes

This course provides an introduction to writing Modern Fortran.
It covers everything from basic syntax and variables.
To functions, arrays, and modules.
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

You can also install GFortran via conda:

```bash
$ conda install gfortran 
```

### Intel

The Intel Fortran compiler is free through their oneAPI toolkit.

- [Linux Install Instructions](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2025-0/intel-fortran-essentials.html#GUID-E8EA92E5-84BC-4550-9988-4A9147A1B769)
- [Windows Install Instructions](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-windows/2025-0/intel-fortran-essentials.html)

Note: The Intel compiler is not available for macOS.

You can also install the Intel compiler via conda:

```bash
$ conda install intel-fortran-rt
```

### Flang

LLVM Flang is another open source compiler
based on the LLVM compiler toolkit.
Flang is installed from the LLVM source code.
If you have not built programs from source before
we recommended choosing another compiler
or installing Flang via conda.
[Link to the Flang Getting Started page](https://flang.llvm.org/docs/GettingStarted.html)

You can also install the Flang compiler via conda:

```bash
$ conda install flang
```

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

    print *, 'Hello World!'

end program

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
Hello World!
```

You have compiled your first Fortran program!
The first episode in this lesson will
cover compiling in more detail.

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

[install-gfortran]: https://fortran-lang.org/learn/os_setup/install_gfortran/
