---
title: 'Logic'
teaching: 15
exercises: 15
---

::::::::::::::::::::::::::::::::::::: questions

- How do we declare and assign values to variables?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand the different intrinsic data types.
- Declare and assign variables and parameters.

::::::::::::::::::::::::::::::::::::::::::::::::

Fortran's `logical` type has two values:

```fortran
  logical :: is_below_20_metres = .false.
  logical :: use_stochastic_physics = .true.
```

### Logical operators

Values can be tested logical operators `.or.`, `.and.` and `.not.` are available, and 
these can be used to set the value of logical variables. 

The precedence is illustrated by, e.g.,
```fortran
  q = i .or. j .and. .not. k    ! evaluated as i .or. (j .and. (.not. k))
```
where q, i, j, and k are all logical variables.

Use brackets to avoid confusion over operator precedence.

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

:::::::::::::::::::::::::::::::::::::::: keypoints

- Th

::::::::::::::::::::::::::::::::::::::::::::::::::
