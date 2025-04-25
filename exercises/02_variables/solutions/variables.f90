!--------------------------------------------------------
! Carpentries - Introduction to Modern Fortran
! CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
!--------------------------------------------------------
!
program variables

    implicit none

    integer   :: number_of_pelicans
    real      :: pelican_weight
    complex   :: pelican_population_dynamics
    logical   :: is_young_pelican
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
