!--------------------------------------------------------
! Carpentries - Introduction to Modern Fortran
! CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
!--------------------------------------------------------
!
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

    radius = 5.0_r_64  ! cm
    area = pi * radius**2

    print *, 'Pi = ', pi
    print *, 'Radius = ', radius, ' cm'
    print *, 'Area = ', area, ' cm^2'

end program maths
