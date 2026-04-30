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

hot .or. dry .and. .not. rainy    ! evaluated as hot .or. (dry .and. (.not. rainy))

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

::::::::::::::::::::::::::::::::::::::: challenge

## Logical precedence

Compile the program and run it to check the result.
A good day means that the temperature is between 18 and 25 degrees,
the wind is less than 20 m/s and it does not rain.

Does the program return the correct value?

Add any necessary `()` to fix the logic and get the correct value.

```fortran
program weather

  implicit none

  real    :: temp, wind
  logical :: rain
  logical :: good_weather

  temp = 20.0
  wind = 10.0
  rain = .false.

  good_weather = temp >= 18.0 .and. temp <= 25.0 .and. wind < 20.0 .and. .not. rain

  print *, "Is it a nice day?", good_weather

end program weather
```

::::::::::::::: solution

## Solution

```fortran
program weather

  implicit none

  real    :: temp, wind
  logical :: rain
  logical :: good_weather

  temp = 20.0
  wind = 10.0
  rain = .false.

  good_weather = (temp >= 18.0 .and. temp <= 25.0) .and. (wind < 20.0) .and. (.not. rain)

  print *, "Is it a nice day?", good_weather

end program weather
```

::: group-tab

### GFortran

```bash
gfortran -o weather weather.f90
```

### Intel

```bash
ifx -o weather weather.f90
```

### Flang

```bash
flang -o weather weather.f90
```

### Cray

```bash
ftn -o weather weather.f90
```

:::

```output
$  ./weather
 Is it a nice day? T
```

:::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::

### Logical equivalence

To test if logical expressions or variables are equivalent,
we use the `.eqv.` and `.neqv.` operators.

:::: challenge

## Using logical operators

Complete the following program by replacing the **__**
with the correct logical operators,
so that the output is as shown below.

```fortran
program logic

   implicit none

   real,    parameter :: pi     = 3.14159265
   logical, parameter :: switch = .true.

   real    :: a = 3.0
   logical :: output1, output2, output3

   output1 = a __ pi

   output2 = __ output1

   output3 = output2 __ switch

   print *, output1
   print *, output2
   print *, output3

end program logic
```

::: group-tab

### GFortran

```bash
gfortran -o logic logic.f90
```

### Intel

```bash
ifx -o logic logic.f90
```

### Flang

```bash
flang -o logic logic.f90
```

### Cray

```bash
ftn -o logic logic.f90
```

:::

```output
$  ./logic
 F
 T
 T
```

::: solution

```fortran
program logic

   implicit none

   real,    parameter :: pi     = 3.14159265
   logical, parameter :: switch = .true.

   real    :: a = 3.0
   logical :: output1, output2, output3

   output1 = a >= pi

   output2 = .not. output1

   output3 = output2 .eqv. switch

   print *, output1
   print *, output2
   print *, output3

end program logic
```

:::
::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- The `logical` type has two values: `.true.` and `.false.`.
- Prefer using symbols for operators instead of the older form such as:
  `<` instead of `.lt.`.
- Use brackets to avoid confusion over operator precedence.

::::::::::::::::::::::::::::::::::::::::::::::::::
