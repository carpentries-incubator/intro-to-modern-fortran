!--------------------------------------------------------
! Carpentries - Introduction to Modern Fortran
! CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
!--------------------------------------------------------
!
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
    pelican_weight              = 2.5              ! kg
    pelican_population_dynamics = (-1.2e3, 0.9e2)  ! births, deaths per year
    is_young_pelican            = .false.

    print *, number_of_pelicans
    print *, pelican_weight
    print *, pelican_population_dynamics
    print *, is_young_pelican
    print *, pelican_tag

end program variables
