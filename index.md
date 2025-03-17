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
Many of the research codes run on ARCHER2[^archer2]
are Fortran programs.[^archer2-codes]
Various areas of Science are covered by these Fortran programs.
For example quantum chemistry, plasmas, and numerical weather prediction.

More recent standards of Fortran come under the umbrella term "Modern Fortran".
These are the Fortran 95 standard,
and more recent standards.[^fortran-standards]

## Learning Outcomes

This course provides an introduction to writing Modern Fortran.
It covers everything from basic syntax and variables.
To functions, arrays, and modules.
Common Fortran idioms are introduced and compared to C++.

Within the first hour you will have:

- written a hello world program
- compiled your first program
- done basics maths in a program

At the end of the course you should be able to:

- understand many Fortran programs
- write well-structured Fortran
- write portable Fortran modules

Fortran is a rather "large" language, so it is not possible to cover all its features in this course.
We focus on features used to write modern HPC code.
Other features you might encounter in legacy code are explained in spoilers:

::: spoiler

### Legacy Fortran

You will see spoilers like this in the lesson.
They contain features more commonly used in legacy code.
These spoilers explain why the feature
is not used often in modern code.

:::

The follow on lesson **Object Orientated Fortran**
(coming soon) contains further advanced topics.

::::::::::::::::::::::::::::::::::::: prereq

### Prerequisites

Learners *should* be familiar with the basic concepts of
programming: variables, logic, control flow, loops, functions and
so on.
No knowledge of Fortran is assumed.
No previous experience with compiled languages is required.

::::::::::::::::::::::::::::::::::::::::::::

[workbench]: https://carpentries.github.io/sandpaper-docs
[archer2]: ARCHER2 is one of the UKs national supercomputing facilities.
[archer2-codes]: https://www.archer2.ac.uk/news/2021/05/19/code-use.html
[fortran-standards]: https://fortranwiki.org/fortran/show/Standards
