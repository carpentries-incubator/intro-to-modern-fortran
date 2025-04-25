---
title: 'Variables'
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

Variables store information we can use in our programs.
Fortran is a ***strongly typed*** language.
Each variable must be declared with a type.[^static]
Fortran provides the following intrinsic (built-in) data types for variables:

- `integer`: A whole number which is positive, negative or zero.
- `real`: A real number includes the fractional part,
  even if the fractional part is 0.
- `complex`: A number made up of a real and an imaginary part.
- `logical`: A boolean value which can be **.true.** or **.false.**.
- `character`: A single ASCII character.
  Strings are made from sequences of characters.

Variable names must be 63 characters or less (F2003 standard).
No spaces are allowed.
Names can contain the characters `a-z`, `A-Z`, `0-9` and the underscore `_`.
No spaces are allowed.
Names must begin with a letter.
This also applies to names for programs, modules, subroutines,
and functions, which you will learn about later in the course.

Do **not** use Fortran keywords as variable names.
Fortran will let you overwrite these keywords if you're not careful.
The [Fortran wiki keywords page](https://fortranwiki.org/fortran/show/Keywords)
contains a list of all Fortran keywords.

[^static]: Fortran is also ***statically typed***.
           You can not change a variables type after the variable declaration.

## Declaring Variables

Fortran variables are declared with this syntax:

```fortran
<variable_type> :: <variable_name>
```

So to declare an integer:

```fortran
integer :: number_of_pelicans
```

For this episode complete challenges in:

```bash
cd ~/Desktop/intro-to-modern-fortran/02-variables
```

:::: challenge

## Create a `variables` program

1. Create a new Fortran program named `variables.f90`.
2. Declare 5 variables. One of each of the 5 intrinsic data types.
3. Print your variables.
4. Compile and run your program.

What do you notice about the output?

::: solution

```fortran
program variables

    implicit none

    integer   :: number_of_pelicans
    real      :: pelican_weight
    complex   :: pelican_population_dynamics
    logical   :: is_young_pelican
    character :: pelican_tag

    print *, number_of_pelicans
    print *, pelican_weight
    print *, pelican_population_dynamics
    print *, is_young_pelican
    print *, pelican_tag

end program variables

```

::: group-tab

### GFortran

```bash
gfortran -o variables variables.f90
```

### Intel

```bash
ifx -o variables variables.f90
```

### Flang

```bash
flang -o variables variables.f90
```

### Cray

```bash
ftn -o variables variables.f90
```

:::

```bash
./variables
```

The output below is from the GNU gfortran compiled executable:

```output
  -922534656
   0.00000000    
        (2.063298560E+11,0.00000000)
 T
```

Where did those values come from?
If you forget to assign a value to a variable
the output will depend on your compiler.
Here the program accessed the memory allocated for each variable
and printed what was leftover in the memory from other processes.

Most compilers have a flag which warns you
if there are uninitialised variables in your code.
Have a look and see if there is a flag like this for your compiler.

:::
::::

::: spoiler

### Style

- Fortran is case-insensitive.
  This course prefers the use of lowercase.
- Fortran file names must match the name of the program or module
  contained in the file.
  ie. `variables.f90` contains the program `variables`.
  `matrix_mod.f90` contains the module `matrix_mod`.
- `::` markers should be aligned to improve readability.

:::

## Variable Assignment

Variables are assigned using the assignment operator `=`:

```fortran
<variable> = <value>
```

For example:

```fortran
number_of_pelicans          = 5
pelican_weight              = 2.5  ! kg
pelican_population_dynamics = (-1.2, 0.9)
is_young_pelican            = .false.
pelican_tag                 = 'Jeff'
```

Logicals can be `.true.` or `.false.`.
Characters (strings) such as `pelican_tag` can be surrounded
by single or double quotes.

:::: challenge

## Modify your `variables` program

1. Assign values to the variables in your program.
2. Compile and run your program.

::: solution

```fortran
program variables

    implicit none

    integer   :: number_of_pelicans
    real      :: pelican_weight
    complex   :: pelican_population_dynamics
    logical   :: is_young_pelican
    character :: pelican_tag

    number_of_pelicans          = 5
    pelican_weight              = 2.5  ! kg
    pelican_population_dynamics = (-1.2, 0.9)
    is_young_pelican            = .false.
    pelican_tag                 = 'J'

    print *, number_of_pelicans
    print *, pelican_weight
    print *, pelican_population_dynamics
    print *, is_young_pelican
    print *, pelican_tag

end program variables

```

::: group-tab

### GFortran

```bash
gfortran -o variables variables.f90
```

### Intel

```bash
ifx -o variables variables.f90
```

### Flang

```bash
flang -o variables variables.f90
```

### Cray

```bash
ftn -o variables variables.f90
```

:::

```bash
./variables
```

Example output:

```output
           5
   2.50000000    
           (-1.20000005,0.899999976)
 F
 J
```

:::
::::

::: spoiler

### Style

- The assignment operator `=` should be aligned to improve readability.
- Variable names are written in snake case and are verbose.
- Variables with units must have a comment (Ford or vanilla Fortran style) with the unit.

:::

::: caution

### Assignment on declaration

Fortran lets you assign a value to a variable when you declare it.

```fortran
integer :: number_of_pelicans = 5
```

This gives the variable the `save` attribute.
With `save` the variable will keep its value between procedure (function) calls.
This is not good practice.
Never assign a value to a variable on declaration unless it's a parameter.

:::

## Parameters

In your program, it is possible to change the values of initialised variables, e.g.

```fortran
program variables

    implicit none

    integer   :: number_of_pelicans
    real      :: pelican_weight
    complex   :: pelican_population_dynamics
    logical   :: is_young_pelican
    character :: pelican_tag

    number_of_pelicans          = 5
    pelican_weight              = 2.5  ! kg
    pelican_population_dynamics = (-1.2, 0.9)
    is_young_pelican            = .false.
    pelican_tag                 = 'J'

    ! print *, number_of_pelicans
    ! print *, pelican_weight
    ! print *, pelican_population_dynamics
    ! print *, is_young_pelican
    print *, pelican_tag

    ! Changing the value of the tag
    pelican_tag = 'F'
    print *, pelican_tag

end program variables

```

This will now give the output:

```output
 J
 F   
```

However, you can also define constant values that cannot change.
You do this by defining variables using `parameter`.
We are then unable to modify `parameter` variables, e.g.

```fortran
character, parameter :: pelican_tag = 'J'
```

:::: challenge

## Add a parameter to your `variables` program

1. Modify a variable in your code to be a parameter.
2. Try modifying the parameter in your code.
   What output do you get when compiling?

::: solution

```fortran
program variables

    implicit none

    integer :: number_of_pelicans
    real    :: pelican_weight
    complex :: pelican_population_dynamics
    logical :: is_young_pelican
    
    character, parameter :: pelican_tag = 'J'

    number_of_pelicans          = 5
    pelican_weight              = 2.5  ! kg
    pelican_population_dynamics = (-1.2, 0.9)
    is_young_pelican            = .false.
    ! pelican_tag               = 'J'

    print *, number_of_pelicans
    print *, pelican_weight
    print *, pelican_population_dynamics
    print *, is_young_pelican
    print *, pelican_tag

    pelican_tag = 'F'

end program variables

```

Here we have modified `pelican_tag` to be the parameter.
Then at the end of the program we attempt to change its value.

Example GFortran output:

```output
variables.f90:23:4:

   23 |     pelican_tag = 'F'
      |    1
Error: Named constant ‘pelican_tag’ in variable definition context (assignment) at (1)
```

The compiler has given us an error.
This is because we are trying to edit the value, `variable definition context (assignment)`, of a parameter, `Named constant`.
The error is in the `variables.f90` file,
on line `23`, starting at character `4`.
This location has been marked as `1` in the compiler output.

Different compilers will show different error messages.
Some have clearer messages for certain errors than others.
We recommend testing code with **at least** two compilers.
This will aid your debugging and help make your code more portable.

:::
::::

:::: challenge

## Tidy up your program

1. Make sure your code conforms to the style
followed by this course.
2. Add Ford comments to document the program
and each variable.

::: solution

```fortran
program variables
    !! A test program to lean how to declare and assign variables.

    implicit none

    integer :: number_of_pelicans
      !! The number of pelicans in the pod
    real    :: pelican_weight
      !! The average weight of a pelican in the pod / kg
    complex :: pelican_population_dynamics
      !! The birth and death rate as a complex number
      !! Units are the number of pelicans per year
    logical :: is_young_pelican
      !! Test to see if the current pelican is young

    character, parameter :: pelican_tag = 'J'
      !! Pelican pod tracking tag

    number_of_pelicans          = 5
    pelican_weight              = 2.5          ! kg
    pelican_population_dynamics = (-1.2, 0.9)  ! births, deaths per year
    is_young_pelican            = .false.

    print *, number_of_pelicans
    print *, pelican_weight
    print *, pelican_population_dynamics
    print *, is_young_pelican
    print *, pelican_tag

end program variables

```

Notice we have left an extra blank line in-between the parameter
declaration and the other variable declarations.
This is so we didn't have to align all the `::` markers far to the right.
If you are declaring lots of variables,
break up the declarations into sections for readability.

:::
::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- There are 5 intrinsic data types for Fortran variables: `integer`, `real`, `complex`, `logical`, and `character`.
- Fortran variables are declared with the syntax: `<variable_type> :: <variable_name>`
- Assign a value to a variable with the syntax: `<variable> = <value>`
- Never assign a value on the same line as a variable is declared.
  This gives the variable the `save` attribute.
- Parameters are variables whose value can't be changed:
  `<variable_type>, parameter :: <variable_name> = <variable_value>`.

::::::::::::::::::::::::::::::::::::::::::::::::::
