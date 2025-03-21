---
site: sandpaper::sandpaper_site
---

::: caution

This is a new lesson built with [The Carpentries Workbench][carpentries-workbench].
It is currently in pre-alpha development by the
[British Geological Survey][bgs-link],
the [National Centre for Atmospheric Science][ncas-link],
the [National Oceanography Centre][noc-link],
and the [Met Office][uk-met-link].

The lesson adapts resources from
[ARCHER2](https://github.com/ARCHER2-HPC/archer2-fortran-intro),
[Imperial College London](https://github.com/ImperialCollegeLondon/RCDS-introduction-to-fortran),
[Modern Fortran in Science and Technology course](https://github.com/jonaslindemann/modern_fortran_book?tab=readme-ov-file),
[LRZ's Programming with Fortran course](https://doku.lrz.de/programming-with-fortran-10746212.html),
and more.[^other-courses]

:::

Fortran was created in 1957 by a team at IBM
and excels with numerically intensive science code.
Far from the punchcards, and fixed-form formatting of Fortran's early days,
modern Fortran is fast, supports object orientated programming
and is easy to read.

Fortran is often used to write code for High Performance Computing (HPC).
Many of the research codes run on ARCHER2[^archer2]
are Fortran programs.[^archer2-codes]
Various areas of Science are covered by these Fortran programs.
For example quantum chemistry, plasmas, and numerical weather prediction.

More recent standards of Fortran come under the umbrella term "Modern Fortran".
These are the Fortran 95 standard,
and more recent standards.[^fortran-standards]

::::::::::::::::::::::::::::::::::::: prereq

### Prerequisites

Learners _should_ be familiar with the basic concepts of
programming: variables, logic, control flow, loops, functions and
so on.
No knowledge of Fortran is assumed.
No previous experience with compiled languages is required.
Access to the command line is required.
Learners _must_ be comfortable using the command line[^command-line].

::::::::::::::::::::::::::::::::::::::::::::

This lesson has been tested primarily on Linux.
Windows users may find it easier to install
[Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install).
With WSL you will have access to a Linux command line.
Windows and macOS users should open an
[Issue](https://github.com/carpentries-incubator/intro-to-modern-fortran/issues)
if you find problems with the lesson material.

[^other-courses]: Discussion #3 on the lesson repository, https://github.com/carpentries-incubator/intro-to-modern-fortran/discussions/3, give details on the materials this course draws from.
[^archer2]: ARCHER2, https://www.archer2.ac.uk/, is one of the UKs national supercomputing facilities.
[^archer2-codes]: ARCHER2 code use article: https://www.archer2.ac.uk/news/2021/05/19/code-use.html
[^fortran-standards]: Fortran standards page on the Fortran Wiki: https://fortranwiki.org/fortran/show/Standards
[^command-line]: Learners should be comfortable with the Carpentries Unix Shell lesson material: https://swcarpentry.github.io/shell-novice/
