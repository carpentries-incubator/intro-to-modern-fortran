---
title: 'Basics'
teaching: 35
exercises: 15
---

::::::::::::::::::::::::::::::::::::: questions

- How do we represent and manipulate data in Fortran?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand the different intrinsic data types
- Understand the different intrinsic operators and functions available

::::::::::::::::::::::::::::::::::::::::::::::::

## Fortran data types

Fortran provides the following intrinsic data types:

* numeric types 
  * `integer`
  * `real`
  * `complex`
* non-numeric types 
  * `logical`
  * `character`

### Defining numeric variables

The following program declares a variable with each of the three intrinsic
numeric types, and provides an initial value in each case.
```fortran
program example1

   integer :: i = 1           ! An integer
   real    :: a = 2.0         ! A floating point number
   complex :: z = (0.0, 1.0)  ! A complex number as (real-part, imag-part)

end program example1
```
Initial values are optional, and these values may be changed later within the code. 
If a declaration does not specify an initial value, the variable is said to be _undefined_.

### Variable names

The valid Fortran character set for names is `a-z`, `A-Z`, `0-9` and the
underscore `_`. Valid names must begin with a character. The maximum
length of a name is 63 characters (introduced in the F2003 standard) with 
no spaces allowed. This includes names for programs, modules, subroutines, 
and functions, as well as names for variables.

### The `implicit` statement

By default, variables in Fortran do not need to be declared a specific type, they 
can just be used within the code. Variables with names beginning with letters `i-n` are implicitly
of type `integer`, while anything else is of type `real` (unless explicitly declared otherwise).

**This is very bad practice and modern Fortran should not be used in this way.** 

The solution to prevent errors involving undeclared variables (usually arising from
typos) is to declare that no names have implicit type via the use of the
```fortran
implicit none
```
statment at the very top of the code. 

With this statement inserted, all variable names must be declared explicitly before they
are referenced. It is still common to see variables beginning with `i-n` as integers.

::::::::::::::::::::::::::::::::::::: challenge

## Use `implicit none`

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

### Parameters

In the above example, it is possible to change the values of initialised variables, e.g.
```fortran
program example2
   implicit none

   real :: a = 2.0

   print *, a

   a = a + 5.0

   print *, a

end program example2
```
This will then give the output:
```
$ ./a.out 
   2.00000000    
   7.00000000   
```
However, you can also define constant values that cannot change by defining variables using `parameter`.
We are then unable to modify `parameter` variables, e.g.
```fortran
program example3
   implicit none

   real, parameter :: pi = 3.14159265

   pi = pi + 2.0

   print *, pi

end program example3
```
When compiling this program, this will give an error similar to the following from the `gfortran` compiler:
```
example3.f90:6:3:

    6 |    pi = pi + 2.0
      |   1
Error: Named constant 'pi' in variable definition context (assignment) at (1)
```

::::::::::::::::::::::::::::::::::::: challenge

## Write a Fortran program to calculate the circumference of a circle

Using the `parameter` statement, write a Fortran program to calculate the circumference of a circle of
radius 3.0.

::::::::::::::::: hint

The cicumference $c$ of a circle can be calculated from the radius $r$ and constant $\pi$ by

$c = 2 \pi r$

::::::::::::::::::::::

:::::::::::::::: solution

```fortran
program solution2
   implicit none

   real, parameter :: pi = 3.14159265

   real :: r=3.0           ! radius of the circle
   real :: c               ! circumference of the circle

   c = 2.0 * pi * r

   print *, c

end program solution2
```
Compiling and running this code will give the following output
```
$ ./a.out 
   18.8495560   
```

:::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::

## Logical variables

Fortran has a `logical` type that has two literal values, True and False, defined by
```fortran
  logical :: switch0 = .false.
  logical :: switch1 = .true.
```

### Logical operators and expressions

Values can be tested logical operators `.or.`, `.and.` and `.not.` are available, and 
these can be used to set the value of logical variables. 

The precedence is illustrated by, e.g.,
```fortran
  q = i .or. j .and. .not. k    ! evaluated as i .or. (j .and. (.not. k))
```
where q, i, j, and k are all logical variables.

The use of parentheses is highly recommended to avoid ambiguity and/or to add clarity.

### Relational operators

To form logical expressions from numeric or other expressions, we require
relational operators. The are two forms in Fortran, illustrated in the table
below. It is recommended that you avoid the older form.

| Relation                 | Operator | Older form | For              |
|--------------------------|----------|------------|------------------|
| Less than                | `< `     | `.lt.`     | `integer` `real` |
| Less than or equal to    | `<=`     | `.le.`     | `integer` `real` |
| Greater than             | `> `     | `.gt.`     | `integer` `real` |
| Greater than or equal to | `>=`     | `.ge.`     | `integer` `real` |
| Equal to                 | `==`     | `.eq.`     | `integer` `real` `complex`|
| Not equal to             | `/=`     | `.neq.`    | `integer` `real` `complex`|

### Logical equivalence

Equivalence between two logical expressions or variables is established
via the logical operators `.eqv.` and `.neqv.`. 

While some some compilers may allow the use of `==`, this should be avoided.

### Using logical operators

These operators can be used to check and set the values of logical variables, dependent on other variables, e.g.
```fortran
program example4
   implicit none

   real, parameter    :: pi      = 3.14159265
   logical, parameter :: switch1 = .true.

   real    :: a=3.0
   logical :: test1, test2, test3

   test1 = a >= pi               ! True if a is greater than or equal to pi

   test2 = (.not. test1)         ! True if test1 is False, False if test1 is True

   test3 = (test2 .eqv. switch1) ! True if test2 is True, False if test2 is False

   print *, test1

   print *, test2

   print *, test3

end program example4
```
Compiling and running this code will give the following output
```
$  ./a.out 
 F
 T
 T
```

## Character variables

Character variables are strings that hold zero or more characters. Some examples are:
```fortran
program example5
  implicit none

  character (len = *), parameter :: string1 = "don't"   ! assumed length of 5 characters
  character (len = 5)            :: string2 = "Don""t"  ! 5 characters
  character (len = 6)            :: string3 = ' don''t' ! blank + 5 characters

end program example5
```
There should be a `len` specifier. Specifying `len = *` means that the length will be assumed
from the length of the string. A space is a valid character in a string.

Strings must be defined within quotation marks, either single, `'`, or double, `"`, beginning 
and ending with the same type of mark. To define a quotation mark within a string, either
use one of the alternative type, e.g. `"'"`, or use two of the same type, e.g. `''''`, which
will be intepreted as a single mark within the string.

Strings may be concatenated with the string concatenation operator `//`. For example `string2` 
and `string3` could be concatenated into a new variable `string4` by
```fortran
  string4 = string2//string3
```
A single character, or a subset of characters, can be extracted via
use of an array-index like notation by defining the start and end characters
to extract, e.g. `string1(1:1)` would extract only the first character from the string 
variable `string1`. 

::::::::::::::::::::::::::::::::::::: challenge

## Working with strings

Using the above `example5`, concatenate `string2` and `string3` into a new variable `string4`, 
and print out the values of all strings. Also, print the third character of `string4`.

:::::::::::::::: solution

```fortran
program solution3
  implicit none

  character (len = *), parameter :: string1 = "don't"   ! 5 characters
  character (len = 5)            :: string2 = "Don""t"  ! 5 characters
  character (len = 6)            :: string3 = ' don''t' ! blank + 5 characters
  character (len = 11)           :: string4             ! length of string2+string3

  string4 = string2//string3

  print *, string1 

  print *, string2

  print *, string3

  print *, string4

  print *, string4(3:3)

end program solution3
```
Compiling and running this code will give the following output
```
$ ./a.out 
 don't
 Don"t
  don't
 Don"t don't
 n
```

:::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::

