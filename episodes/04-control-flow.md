---
title: "Control flow"
teaching: --
exercises: --
---

::::::::::::::::::::::::::::::::::::: questions

- How do you repeat code execution?
- How do you control which part of the code should be executed?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

Be able to

- write repetitive statements
- control code execution with conditional statements


::::::::::::::::::::::::::::::::::::::::::::::::

## Conditionals

Executing code base on different conditions being met is key when writing code. 
Fortran supports conditional statements with the `if` and `select` construct. 

An `if` statement associated with only one condition will look like this:

```fortran
  if (boolean-expression) then
      ! do something
  end if
```
So, if the boolean expression is true, the code inside the if statement will be 
executed. 

It is also possible to construct a conditional statements with more than one condition 
using `else` and `else if`:

```fortran
  if (boolean-expression) then
      ! do something
  else if (another-boolean-expression) then
      ! do something different
  else
      ! do something in any onther case
  end if
```

In this example, `boolean-expression` is evaluated first and if it is true, the code 
inside the if will be executed. If not, `another-boolean-expression` is evaluated and
the code is executed if it is true. If not other expression is true, then the code 
inside the `else` statement is executed. 

TODO: select + exersise 

## Loops

It is possible to repeat or iterate on Fortran using the `do` construct (similar to 
the `for` construct used in other programming languages). 

The simplest iteration will look like this:

```fortran
  do
    ! some code than gets execute for ever
  end do
```

Whatever we put in between `do` and `end do` will be executed for ever. This is 
because we have not controlled or limited the execution with a integer control variable. 
In the following example `i` is the control variable that start at `1`, ends at `5` 
and `2` is the step interval.

```fortran
program loop

    implicit none

    integer :: i

    do i=1,5,2
        print *, i
    end do

end program loop
```
```output
 1
 3
 5
```


Generally we have the following structure:

```fortran
  do variable = int-start, int-end [, int-step]
```

And the number of iterations will be:

```
  max(0, (int-end - int-start + int-step)/int-step)
```
So, in our example `max(0, (5 - 1 + 2)/2) = 3`. The step interval is not mandatory, 
if it is not given it is assumed to be 1. 

::::::::::::::::::::::::::::::::::::::: challenge

## Number of iterations

What the number of iterations in the following cases?

```fortran
   do i = 1, 10
     print *, "i is  ", i
   end do

   do i = 1, 10, -2
     print *, "i is ", i
   end do

   do i = 10, 1, -2
     print *, "i is ", i
   end do
```

::::::::::::::: solution

## Solution

1- `max(0, (10 - 1 + 1)/1) = 10`
2- `max(0, (10 - 1 + -2)/-2) = 0`
3- `max(0, (1 - 10 + -2)/-2) = 5`

To further check, you can compile and run this code:

```fortran
program number_iterations

  implicit none

  integer :: i

  print *, "First loop: 1, 10"
  do i = 1, 10
    print *, "i is ", i
  end do

  print *, "Second loop: 1, 10, -2"
  do i = 1, 10, -2
    print *, "i is ", i
  end do

  print *, "Third loop: 10, 1, -2"
  do i = 10, 1, -2
    print *, "i is ", i
  end do

end program
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

TODO: complex example using do and if

TODO: cycle and exit

TODO: Exercise 
