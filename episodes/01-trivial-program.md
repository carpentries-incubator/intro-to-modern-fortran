---
title: 'A Trivial Program'
teaching: --
exercises: --
---

::::::::::::::::::::::::::::::::::::: questions

- How do we construct a minimal (trivial) program in Fortran?
- How do we compile the source code to make an executable?
- How do we run that executable and see any output?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

Be able to
- write
- compile
- run

a basic Fortran program.

::::::::::::::::::::::::::::::::::::::::::::::::

## Fortran hello_world

```fortran
program hello_world

  implicit none ! here's an inline comment

! Here's a comment

  print *, "hello world!"

end program hello_world
```

The first statement `program hello_world` defines the program name (`hello_world`). Note it is matched by a corresponding `end program hello_world` at the end.


Formally, a Fortran program consists of one or more lines made up of Fortran statements. Line breaks are significant (e.g., there are no semi-colons ; required here).

Comments are introduced with an exclamation mark `!`, and may trail other statements.

:::::::::::::::::::::::::::::::::::::::::  callout

## Old (F77) style comments

You may see older Fortran code that has comments written as

```fortran 
c      this is a comment
```

with a `c` in the first column. In general, if you are introducing new comments, you should use the `!`. 

::::::::::::::::::::::::::::::::::::::::::::::::::

The only executable line in this program is the `print` statement. We will cover IO in a later episode, but for now, know that `print *, ` will print what follows to screen when the program runs, in this case, the string "Hello world!". Strings in Fortran behave as you would expect (i.e. using 'single' or "double" quotes)

:::::::::::::::::::::::::::::::::::::::::  callout

## implicit none

We have not yet explained the presence of `implicit none`. This is technically not required for this program to execute correctly. However, it will be good practice going forwards and it is generally recommended to use this in your programs to avoid accidents. 

This will be explained in subsequent lessons.

::::::::::::::::::::::::::::::::::::::::::::::::::

## Compiling

Fortran is a compiled language. A compiler turns the human-readable source code into machine code which is then executed by the computer. Languages like Python are interpreted, meaning that the source code is executed directly without being compiled into machine code first. The program is parsed, interpreted, and executed each time it is run. Compiled programs are usually more efficient than interpreted programs. This is a major reason that compiled languages like Fortran remain popular. The draw back is that there is an extra step in building Fortran programs.





The stuff below is included so we know how to include challenges etc. for later.

::::::::::::::::::::::::::::::::::::: challenge

## Header
Edit the above example to include an `implicit none` statment, and print out the three variables

:::::::::::::::: solution

```fortran
program solution1
   implicit none

   integer :: i = 1            ! An integer
   real    :: a = 2.0          ! A floating point number
   complex :: z = (0.0, 1.0)   ! A complex number as (real-part, imag-part)

   print *, i, a, z

end program solution1
```
Compiling and running this code will give the following output
```
$ ./a.out 
  1  2.00000000  (0.00000000,1.00000000)
```

:::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::


## keep for later
By default, variables whose names start with the characters I-N are given the type `integer`, otherwise they are assumed to be of type `real`. This can be disabled by declaring `implicit none` at the start of the `program`, `module`, `function` or `subroutine`.

This will become important when we move on to subsequent lessons.
