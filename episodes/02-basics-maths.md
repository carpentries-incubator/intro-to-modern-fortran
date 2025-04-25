---
title: 'Maths'
teaching: 15
exercises: 15
---

::::::::::::::::::::::::::::::::::::: questions

- How do we perform calculations in Fortran?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Use the built in operators and intrinsic functions.
- Specify the precision of our numeric variables.

::::::::::::::::::::::::::::::::::::::::::::::::

In this episode we will look at arithmetic with Fortran.
Arithmetic operations are where Fortran shines.
Fortran is much faster than Python, Matlab and
other interpreted languages.
Good Fortran code will be comparable in speed,
perhaps faster, than equivalent C/C++ code
depending on your compiler and optimisations.
To provide a good starting point for this episode
complete the challenge below.

:::: challenge

## Create a `maths` Fortran program

1. Create a new Fortran program `maths.f90`.
2. Define a real parameter `pi`.
3. Print the value of `pi`.
4. Check your program compiles and runs.

::: solution

```fortran
program maths
    !! Test program to demonstrate Fortran arithmetic

    implicit none

    real, parameter :: pi = 3.141592654
      !! Value of pi

    print *, 'Pi = ', pi

end program maths

```

Notice the print statement outputs the string
`'Pi = '` before printing the value of `pi` on the same line.

::: group-tab

### GFortran

```bash
gfortran -o maths maths.f90
```

### Intel

```bash
ifx -o maths maths.f90
```

### Flang

```bash
flang -o maths maths.f90
```

### Cray

```bash
ftn -o maths maths.f90
```

:::

```bash
./maths
```

Example output:

```output
   3.14159274
```

This is slightly different to the value we coded.
We will discuss why in the
[`kinds` section](./02-basics-maths.md#kinds) of this episode.

:::
::::

## Operators & Intrinsics

The usual operators are available in Fortran:

Operator | Description
---------|------------
`**`     | Exponent
`*`      | Multiplication
`/`      | Division
`+`      | Addition
`-`      | Subtraction

They are listed in order of precedence.
Fortran also has a number of
[intrinsic maths functions](https://fortran-lang.org/learn/intrinsics/math/).

:::: challenge

## Calculate the area of a circle with radius 5 cm

1. Add two new real variables for the `radius` and `area` to your program.
2. Print the value of `radius` and `area`.
3. Calculate the area of the circle using $\pi r^2$.
4. Check your program compiles and runs.

::: solution

```fortran
program maths
    !! Test program to demonstrate Fortran arithmetic

    implicit none

    real, parameter :: pi = 3.141592654
      !! Value of pi
    
    real :: radius
      !! Radius of the circle in cm
    real :: area
      !! Area of the circle in cm

    radius = 5.0  ! cm
    area = pi * radius**2 

    print *, 'Pi = ', pi
    print *, 'Radius = ', radius, ' cm'
    print *, 'Area = ', area, ' cm^2'

end program maths

```

::: group-tab

### GFortran

```bash
gfortran -o maths maths.f90
```

### Intel

```bash
ifx -o maths maths.f90
```

### Flang

```bash
flang -o maths maths.f90
```

### Cray

```bash
ftn -o maths maths.f90
```

:::

```bash
./maths
```

Example output:

```output
 Pi =    3.14159274    
 Radius =    5.00000000      cm
 Area =    78.5398178      cm^2
```

:::
::::

## Kinds

Numeric types such as `integer`, `real`,
and `complex` can have different floating-point precisions.
This is commonly 32 or 64-bit precision.
We can specify the precision using **kind** parameters.
There are two common ways to specify **kind** parameters:

::: tab

### Using `iso_fortran_env`

We will be using `iso_fortran_env` throughout this lesson.
`iso_fortran_env` is an intrinsic Fortran module.
It was introduced in the F2008 standard.

```fortran
! This goes after the program statement
! We will cover modules in a later episode
use, intrinsic :: iso_fortran_env, only: r_32 => real32, r_64 => real64
```

These parameters are then used when declaring variables:

```fortran
real(kind=r_32), parameter :: earth_radius = 6371_r_32  ! km - single precision
real(kind=r_64)            :: current_distance_from_sun ! Au - double precision
```

and when assigning values to variables:

```fortran
current_distance_from_sun = 1.3_r_64
```

### Using intrinsic functions

```fortran
! hardware specific 32 bit real
integer, parameter :: r_32 = selected_real_kind(6, 37)
! hardware specific 64 bit real
integer, parameter :: r_64 = selected_real_kind(15, 307)
```

These parameters are then used when declaring variables:

```fortran
real(kind=r_32), parameter :: earth_radius = 6371_r_32  ! km
real(kind=r_64)            :: current_distance_from_sun ! Au 
```

and when assigning values to variables:

```fortran
current_distance_from_sun = 1.3_r_64
```

:::

::: caution

### Fortran defaults to single precision

Fortran differs from other languages.
The default precision for reals is single.

```fortran
use, intrinsic :: iso_fortran_env, only: r_64 => real64

real(kind=r_64) :: current_distance_from_sun ! Au 

current_distance_from_sun = 1.3       ! no kind suffix - this is single precision
current_distance_from_sun = 1.3_r_64  ! double precision
```

**Always** use a kind suffix for real and integer types.

:::

::: spoiler

### Style

You can omit the `kind=`:

```fortran
real(kind=r_64)
! is the same as
real(r_64)
```

In this lesson we prefer explicitly stating `kind=`.

:::

::: spoiler

### Legacy

You might see variables declared as:

```fortran
15d00      ! 15.00
9.375d-11  ! 9.375E-11
```

The `d` here specifies the reals as double precision.

You might also see variables with kinds which are plain integers:

```fortran
real(8)
```

Some information on this older style is available in the
[gfortran docs](https://gcc.gnu.org/onlinedocs/gfortran/KIND-Type-Parameters.html).

:::

:::: challenge

## Specify the precision in your program

Update your `maths.f90` program to specify the real kind as `real64`.
Note the output **before** and **after** you modify the precision.
How has the output changed?

::: solution

```fortran
program maths
    !! Test program to demonstrate Fortran arithmetic

    use, intrinsic :: iso_fortran_env, only: r_64 => real64

    implicit none

    real(kind=r_64), parameter :: pi = 3.141592654_r_64
      !! Value of pi

    real(kind=r_64) :: radius
      !! Radius of the circle in cm
    real(kind=r_64) :: area
      !! Area of the circle in cm

    ! this float must be written as 5.0 (sometimes seen as 5.)
    ! not 5 on its own without the decimal point
    radius = 5.0_r_64  ! cm
    area = pi * radius**2

    print *, 'Pi = ', pi
    print *, 'Radius = ', radius, ' cm'
    print *, 'Area = ', area, ' cm^2'

end program maths

```

Example output before (32 bit single precision):

```output
Pi =    3.14159274    
Radius =    5.00000000      cm
Area =    78.5398178      cm^2
```

Example output after (64 bit double precision):

```output
Pi =    3.1415926540000001     
Radius =    5.0000000000000000       cm
Area =    78.539816349999995       cm^2
```

The value of pi now accurately reflects the value you coded in the program.
The value of the area is also now more accurate.

:::
::::

:::: challenge

## Lennard-Jones Potential

Create a new program to calculate the
[Lennard-Jones Potential](https://chem.libretexts.org/Bookshelves/Physical_and_Theoretical_Chemistry_Textbook_Maps/Supplemental_Modules_(Physical_and_Theoretical_Chemistry)/Physical_Properties_of_Matter/Atomic_and_Molecular_Properties/Intermolecular_Forces/Specific_Interactions/Lennard-Jones_Potential)
for two Xenon atoms.
They are separated by 4.0 Angstroms.
Approximate the potential using:

$$V(r)=4\epsilon\left[\left(\frac{\sigma}{r}\right)^{12}-\left(\frac{\sigma}{r}\right)^{6}\right]$$

where:

- $\epsilon=0.997\ kJ/mol$
- $\sigma=3.40\ Angstroms$
- $r=4.0\ Angstroms$

Print the value at the end of your program.

::: solution

In the file `lennard_jones_potential.f90`:

```fortran
program lennard_jones_potential
    !! Calculates the Lennard-Jones Potential for 2 Xenon atoms

    use, intrinsic :: iso_fortran_env, only: i_64 => int64, r_64 => real64

    implicit none

    real(kind=r_64),    parameter :: epsilon = 0.997_r_64  ! kJ/mol
      !! well depth kJ/mol
    real(kind=r_64),    parameter :: sigma = 3.40_r_64     ! Angstroms
      !! van der Waals radius Angstroms
    integer(kind=i_64), parameter :: lj_potential_const = 4_i_64
      !! unit-less Lennard-Jones Potential constant
    
    real(kind=r_64) :: separation_distance
      !! separation distance r in Angstroms
    real(kind=r_64) :: lj_potential
      !! Lennard-Jones Potential kJ/mol

    separation_distance = 4.0_r_64  ! Angstroms

    ! Calculate the Lennard-Jones Potential using:
    ! V(r) = 4*epsilon*[(sigma/r)**12 - (sigma/r)**6]
    lj_potential = lj_potential_const * epsilon * &
                   ((sigma/separation_distance)**12 &
                   - (sigma/separation_distance)**6)

    print *, 'V(4.0 Angstrom) = ', lj_potential, ' kJ/mol'

end program lennard_jones_potential

```

Note:

- We couldn't name the `lj_potential` variable `lennard_jones_potential`
  since that's the program name.
  Try changing it to be the same as the program name.
  What compiler error do you get?
- We've used verbose names for all variables.
  This is good practice since using single character maths related
  variable names makes code harder to read.
  This does mean that the formula on one line
  would break the 80 character line limit in our style guide.
  To get around this the formula has been split over multiple lines
  using the continuation marker `&`.
- The constant `lj_potential_const` has been defined as a variable.
  This avoids [magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming)) in our code.

:::
::::

### Type Casting & Mixed Precision

Take a look at the calculation of `lj_potential` (from the challenge above).
What kinds are each of the variables in the equation?

```fortran
lj_potential = lj_potential_const * epsilon * &
                   ((sigma/separation_distance)**12 &
                   - (sigma/separation_distance)**6)
```

The value we are calculating is a 64 bit real (`lj_potential`).
The first variable in the equation is a 64 bit integer (`lj_potential_const`).
The compiler will ***cast*** the integer
to a 64 bit real before using it in the multiplication.

In this program the casting only occurs once.
Doing this casting many times can slow a program down.
To remove this implicit casting we can:

- cast `lj_potential_const` to a real explicitly before
  the calculation.

  ```fortran
  lj_potential_const_real = real(lj_potential_const, r_64)
  ```

  We would also have to define the new real variable `lj_potential_const_real`.
- declare the constant as a real to start with.
  This is the simplest solution which avoids casting.

  ```fortran
  real(kind=r_64), parameter :: lj_potential_const = 4.0_r_64
  ```

This program uses mixed kinds in its arithmetic.
Some programs have mixed precision as well.
i.e. 32 bit integers in an equation with 64 bit integers.
In this case the 32 bit integers are promoted to 64 bit
by the compiler before use.
It is best to avoid implicit conversions like this
by being consistent with your precision.

:::: challenge

## Remove Casting

1. Find your compiler documentation.
   Is there a flag that warns you about implicit conversions / kind casting?
   If there is, compile your program with the flag.
   What warning do you get?
2. Modify your solution to the last challenge to remove
   any kind casting.

::: solution

1. For gfortran there are two flags we can use.
   These are taken from the
   [gfortran options documentation](https://gcc.gnu.org/onlinedocs/gfortran/Error-and-Warning-Options.html):

   ```shell
   $ gfortran -o ljp lennard_jones_potential.f90 -Wconversion -Wconversion-extra
   ```

2. Example modified code with no kind casting:

```fortran
program lennard_jones_potential
    !! Calculates the Lennard-Jones Potential for 2 Xenon atoms

    use, intrinsic :: iso_fortran_env, only: r_64 => real64

    implicit none

    real(kind=r_64), parameter :: epsilon = 0.997_r_64  ! kJ/mol
      !! well depth kJ/mol
    real(kind=r_64), parameter :: sigma = 3.40_r_64     ! Angstroms
      !! van der Waals radius Angstroms
    real(kind=r_64), parameter :: lj_potential_const = 4_r_64
      !! unit-less Lennard-Jones Potential constant

    real(kind=r_64) :: separation_distance
      !! separation distance r in Angstroms
    real(kind=r_64) :: lj_potential
      !! Lennard-Jones Potential kJ/mol

    separation_distance = 4.0_r_64  ! Angstroms

    ! Calculate the Lennard-Jones Potential using:
    ! V(r) = 4*epsilon*[(sigma/r)**12 - (sigma/r)**6]
    lj_potential = lj_potential_const * epsilon * &
                   ((sigma/separation_distance)**12 &
                   - (sigma/separation_distance)**6)

    print *, 'V(4.0 Angstrom) = ', lj_potential, ' kJ/mol'

end program lennard_jones_potential

```

The exponents in the equation `12` and `6`
have been left as integers.
They have no kind suffix.
This means they are the compilers default integer kind.
Using an integer exponent where possible
is faster than using a real exponent.

:::
::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- Operators in order of precedance: `**`, `*`, `/`, `+`, and `-`.
- List of [intrinsic maths functions](https://fortran-lang.org/learn/intrinsics/math/).
- A numeric variables **kind** specifies its floating-point precision.
  32-bit, 64-bit etc.
- Always specify a kind when defining and assigning values to variables.
  Otherwise Fortran will default to the compilers single precision.
- Avoid mixing precision and kinds
  (e.g. integers with reals, or 32-bit with 64-bit).
  The compiler will implicitly convert the lower precision value
  to a higher precision value.
  This can slow down your programs.

::::::::::::::::::::::::::::::::::::::::::::::::::
