---
title: 'Logic'
teaching: 15
exercises: 15
---

::::::::::::::::::::::::::::::::::::: questions

- How do we declare and assign boolean values?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Declare and assign values to boolean variables.
- Use logical operators in our code.

::::::::::::::::::::::::::::::::::::::::::::::::

Fortran's `logical` type has two values:

```fortran
  logical :: is_below_20_metres = .false.
  logical :: use_stochastic_physics = .true.
```

## Logical operators

Fortran logical expressions use its logical operators:

|      Operator       |      Alternative       |      Description                                                    |
|---------------------|------------------------|---------------------------------------------------------------------|
|     ==              |     .eq.               |     Tests for equality of two operands                              |
|     /=              |     .ne.               |     Test for inequality of two operands                             |
|     >               |     .gt.               |     Tests if left operand is strictly greater than right operand    |
|     <               |     .lt.               |     Tests if left operand is strictly less than right operand       |
|     >=              |     .ge.               |     Tests if left operand is greater than or equal to right operand |
|     <=              |     .le.               |     Tests if left operand is less than or equal to right operand    |

Use brackets to avoid confusion over operator precedence.

### Relational operators

To form logical expressions we use relational operators.
The are two forms given in the table below.
We recommend using the newer form,
given in the second column,
to improve the readability of your code.

| Relation                 | Operator | Older form | For                         |
|--------------------------|----------|------------|-----------------------------|
| Less than                | `<`      | `.lt.`     | `integer`, `real`           |
| Less than or equal to    | `<=`     | `.le.`     | `integer`, `real`           |
| Greater than             | `>`      | `.gt.`     | `integer`, `real`           |
| Greater than or equal to | `>=`     | `.ge.`     | `integer`, `real`           |
| Equal to                 | `==`     | `.eq.`     | `integer`, `real`, `complex`|
| Not equal to             | `/=`     | `.neq.`    | `integer`, `real`, `complex`|

### Logical equivalence

To test if logical expressions or variables are equivalent,
we use the `.eqv.` and `.neqv.` operators.

While some some compilers may allow the use of `==`
to compare logical expressions,
this should be avoided.

### Using logical operators

These operators can be used to check
and set the values of logical variables,
dependent on other variables, e.g.

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

```output
$  ./a.out
 F
 T
 T
```

:::::::::::::::::::::::::::::::::::::::: keypoints

- Th

::::::::::::::::::::::::::::::::::::::::::::::::::
