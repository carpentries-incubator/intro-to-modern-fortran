!--------------------------------------------------------
! Carpentries - Introduction to Modern Fortran
! CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
!--------------------------------------------------------
!
program lennard_jones_potential
    !! Calculates the Lennard-Jones Potential for 2 Xenon atoms

    use, intrinsic :: iso_fortran_env, only: r_64 => real64

    implicit none

    real(kind=r_64), parameter :: epsilon = 0.997_r_64  ! kJ/mol
      !! well depth kJ/mol
    real(kind=r_64), parameter :: sigma = 3.40_r_64     ! Angstroms
      !! van der Waals radius Angstroms
    real(kind=r_64), parameter :: lj_potential_const = 4.0_r_64
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
