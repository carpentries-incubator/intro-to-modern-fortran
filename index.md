---
site: sandpaper::sandpaper_site
---

This is a new lesson built with [The Carpentries Workbench][workbench]. It is currently in pre-alpha development by the [Edinburgh Parallel Computing Centre][epcc-link], the [National Centre for Atmospheric Science][ncas-link], the [National Oceanography Centre][noc-link], and the [UK Met Office][uk-met-link].

This course is aimed at users and developers who know how to program,
but have little or no experience in Fortran, and those who may wish to
have a refresher in Fortran.

::::::::::::::::::::::::::::::::::::: prereq

### Prerequisites

Learners *must* be familiar with the basic concepts of
programming: variables, logic, flow of control, loops, functions and
so on. No knowledge of Fortran is assumed. Previous programming
experience might typically be in the context C/C++ or python.
If you know no programming, we suggest this course on Fortran is not
the place to start.

::::::::::::::::::::::::::::::::::::::::::::

Fortran (a contraction of Formula Translation) was the first programming
language to have a standard (in 1954), but has changed significantly over
the years. More recent standards (the latest being Fortran 2018) come
under the umbrella term "Modern Fortran". Fortran retains very great
significance in many areas of scientific and numerical computing,
particularly for applications such as quantum chemistry, plasmas, and in
numerical weather prediction and climate models.

This course provides an introduction to the basics of writing Fortran.
It will cover basic syntax, variables, expressions and assignments,
flow of control, and introductions to i/o and user-defined types.
Common Fortran idioms are introduced and contrasted with those
available in C-like languages; the course will try to focus on
real usage rather than formal descriptions.

At the end of the course you should be able to understand many Fortran
programs and be confident to start to write well-structured and portable
Fortran. Fortran is a rather "large" language, so it is not possible to
cover all its features in a two day course. Further elements of Fortran
are discussed in the "Intermediate Modern Fortran" course.

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

