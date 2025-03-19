---
title: "A Trivial Program"
teaching: --
exercises: --
---

::::::::::::::::::::::::::::::::::::: questions

- How do you write programs in Fortran?
- How do you compile the Fortran code to make an executable?
- How do we run that executable and see any output?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

Be able to

- write
- compile
- run

a basic Fortran program.

::::::::::::::::::::::::::::::::::::::::::::::::

During the setup you compiled a simple `hello world` program.
Let's look at that program in more detail:

```bash
cd ~/Desktop/intro-to-modern-fortran/01-trivial-program
cat hello_world.f90
```

```fortran
program hello_world

    implicit none

    print *, 'Hello world!'

end program hello_world

```

The first statement `program hello_world` starts the program.
It also defines the program name, `hello_world`.
It is matched by the `end` statement (`end program hello_world`).
The `end` statement is always the last statement in a program.

::: spoiler

### Style Guide - Labels

`program` on its own marks the start of a program
and `end` on its own will end the program.
Words that follow `program` or `end` are labels which improve readability.
Some legacy codes may not have labels.

:::

## Implicit None

Some variables in Fortran have a default type.
Variables with names beginning with letters `i-n`
are implicitly of type `integer`
Anything else is of type `real`.

**This is very bad practice and modern Fortran should not be used in this way.**

To prevent implicit typing we add the:

```fortran
implicit none
```

statement to all `programs`
(and `modules`, `functions`, and `subroutines` that you will encounter in later episodes).

Now all variable names must be declared explicitly before they are referenced.

The only executable line in this program is the `print` statement.
We will cover IO in a later episode.
For now, know that `print *,` will print what follows
to standard output when the program runs.
In this case, it will print the string `Hello world!` to our terminal.

## Comments

Comments start with an exclamation mark `!`.
Comments can appear on their own line,
or after any other Fortran statement.

::::::::::::::::::::::::::::::::::::::::: spoiler

### Legacy Fortran - F77 style comments

You may see code that has comments written like this:

```fortran
c      this is a comment
```

with a `c` in the first column.
In new code use the modern `!` comments.

::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::: challenge

## Add comments to hello_world.f90

Add two comments to your file:

1. The first should explain what the program does
2. The second should explain the purpose of `implicit none`

Think about where the best place for these comments are.

::::::::::::::: solution

## Solution

```fortran
program hello_world
    !! A simple hello world program

    implicit none  ! prevent implicit typing (to integers) of variables
                   ! whose name starts with the letters i-n

    print *, 'Hello world!'

end program hello_world

```

1. We have placed a comment describing the program under the `program` statement.
   You might also see program descriptions before the `program` statement.
   Note the double `!` at the start of the comment.
   This allows the automatic documentation generator [FORD](https://forddocs.readthedocs.io/en/stable/index.html) to extract documentation from the comment.
2. The second comment could have been placed before or after
   the `implicit none` statement.
   We have shown an _inline_ comment.
   Note the two spaces between the Fortran and the start of the comment,
   and the comment spans multiple lines with each `!` aligned vertically.

You may have noticed comments at the top of the Fortran files
you downloaded during the setup.
Those comments provide licensing and authorship information.

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

## Compiling

Fortran is a compiled language (like C++).
A compiler turns human-readable source code into machine code.
This machine code can then be executed by the computer.
Languages like Python are interpreted.
This means Python source code is executed directly
without being compiled into machine code first.
The program is parsed, interpreted, and executed each time it is run.
Compiled programs are usually more efficient than interpreted programs.
This is a major reason that compiled languages like Fortran remain popular.
The draw back is that there is an extra step in building Fortran programs.

There are several steps[^compiler-process] that occur during compilation.
Your compiler takes care of each step for you.
To test your compiler in the setup episode you ran:

::: group-tab

### GFortran

```bash
gfortran hello_world.f90
```

### Intel

```bash
ifx hello_world.f90
```

### Flang

```bash
flang hello_world.f90
```

### Cray

```bash
ftn hello_world.f90
```

:::

This created a file named `a.out`.
This is the default executable name if no name is specified.
To tell the compiler the name of the executable use the `-o` flag:

::: group-tab

### GFortran

```bash
gfortran -o hello_world hello_world.f90
```

### Intel

```bash
ifx -o hello_world hello_world.f90
```

### Flang

```bash
flang -o hello_world hello_world.f90
```

### Cray

```bash
ftn -o hello_world hello_world.f90
```

:::

Now run `ls` to see the new executable:

```bash
ls
```

```output
hello_world  hello_world.f90
```

We now have an executable called `hello_world`.
Sometimes code can compile but fail when executed[^runtime-error].
Let's run this executable to check it works:

```bash
./hello_world
```

```output
 Hello world!
```

::::::::::::::::::::::::::::::::::::::: challenge

## Compiler Documentation and Flags

Take a moment to find and bookmark the documentation for your compiler.
Find the correct flags to:

- Turn on debugging
- Specify the default optimisation level

::::::::::::::: solution

## Solution

- [GNU gfortran command options](https://gcc.gnu.org/onlinedocs/gcc-4.3.6/gfortran/Invoking-GNU-Fortran.html#Invoking-GNU-Fortran)
- [Intel ifx docs](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2025-0/overview.html)
- [LLVM Flang command line reference](https://flang.llvm.org/docs/FlangCommandLineReference.html)
- [Cray ftn docs](https://cpe.ext.hpe.com/docs/latest/cce/man1/crayftn.1.html)

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

## Filenames

Fortran files normally end in `.f90`, although they can have different
[file extensions](https://fortranwiki.org/fortran/show/File+extensions).
The `.f90` extension is the most widely recognised across compilers.
You may see Fortran files with an upper-case extension `.F90`.
This tells the compiler to [pre-process](https://fortranwiki.org/fortran/show/Preprocessors)
the file before compiling.

In the next episode we will introduce variable declaration,
and you will write your first Fortran program from scratch.

:::::::::::::::::::::::::::::::::::::::: keypoints

- Fortran programs start with the `program <label>` statement.
- Fortran programs end with the `end program <label>` statement.
- Always use `implicit none` to prevent implicit typing for variables.
- Fortran comments start with `!`.
- The `-o` flag specifies the name of the compiled executable:
  `<compiler_command> -o <executable_name> <source_file.f90>`.

::::::::::::::::::::::::::::::::::::::::::::::::::

[^compiler-process]: Compilation steps for a C program: <https://www.geeksforgeeks.org/compiling-a-c-program-behind-the-scenes/>, the steps are the same for Fortran!
[^runtime-error]:
    If a program fails to compile that's a _compiler error_.
    If a program compiles but fails to run that's a _runtime error_.
