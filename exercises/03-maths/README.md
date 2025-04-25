# Challenges

## Create a `maths` Fortran program

1. Create a new Fortran program `maths.f90`.
2. Define a real parameter `pi`.
3. Print the value of `pi`.
4. Check your program compiles and runs.

## Calculate the area of a circle with radius 5 cm

1. Add two new real variables for the `radius` and `area` to your program.
2. Print the value of `radius` and `area`.
3. Calculate the area of the circle using $\pi r^2$.
4. Check your program compiles and runs.

## Specify the precision in your program

Update your `maths.f90` program to specify the real kind as `real64`.
Note the output **before** and **after** you modify the precision.
How has the output changed?

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

## Remove Casting

1. Find your compiler documentation.
   Is there a flag that warns you about implicit conversions / kind casting?
   If there is, compile your program with the flag.
   What warning do you get?
2. Modify your solution to the last challenge to remove
   any kind casting.
