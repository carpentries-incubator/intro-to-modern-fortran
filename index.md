---
site: sandpaper::sandpaper_site
---

::: caution

This is a new lesson built with [The Carpentries Workbench][workbench].
It is currently in pre-alpha development by the
[Edinburgh Parallel Computing Centre][epcc-link],
the [National Centre for Atmospheric Science][ncas-link],
the [National Oceanography Centre][noc-link],
and the [Met Office][uk-met-link].

:::

Fortran was created in 1957 by a team at IBM
and excels with numerically intensive science code.
Far from the punchcards, and fixed-form formatting of Fortrans early days,
modern Fortran is fast, supports object orientated programming
and is easy to read.

Fortran is often used to write code for High Performance Computing (HPC).
At ARCHER2, one of the UKs national supercomputing facilities, some of
the top research codes are written in Fortran.[^archer2-codes]
Fortran retains extensive usage in many areas of scientific
and numerical computing,
particularly for applications such as quantum chemistry, plasmas, and in
numerical weather prediction and climate models.

More recent standards of Fortran (the latest being Fortran 2023) come
under the umbrella term "Modern Fortran".
This course provides an introduction to the basics of writing Modern Fortran.
It will cover everything from basic syntax, variables,
expressions and assignments,
to functions, arrays, and modules.
Common Fortran idioms will be introduced and contrasted with those
available in C-like languages.

At the end of the course you should be able to understand many Fortran
programs and be confident writing well-structured and portable Fortran.
Fortran is a rather "large" language, so it is not possible to
cover all its features in this course.
Further elements of Fortran are discussed in the
"Object Orientated Fortran" course (coming soon).

::::::::::::::::::::::::::::::::::::: prereq

### Prerequisites

Learners *should* be familiar with the basic concepts of
programming: variables, logic, flow of control, loops, functions and
so on.
No knowledge of Fortran is assumed.
No previous experience with compiled languages is required.

::::::::::::::::::::::::::::::::::::::::::::

The course requires a Fortran compiler, for which a local machine or
laptop may be appropriate [1]. If you do not have access to a Fortran
compiler, course training accounts on archer2 will be available which
provide access to various compilers. Use of a text editor will be
required (some may prefer an IDE, but we do not intend to consider or
support IDEs).

[1] This may typically be GFortran, freely available as part of
    Gnu Compiler Collection (GCC).
    See e.g., [Link to GFortran install page on fortran-lang][install-gfortran]


[workbench]: https://carpentries.github.io/sandpaper-docs
[archer2-codes]: https://www.archer2.ac.uk/news/2021/05/19/code-use.html

