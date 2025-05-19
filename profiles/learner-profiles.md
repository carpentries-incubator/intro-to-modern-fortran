---
title: Learner Profiles
---

This page outlines how [this course][this-course-link] links to other Fortran lessons. Use the learning pathways on this page to decide if the course is right for you.

## Pathways

This course is merely an introduction to modern Fortran, and most learners will also want to take the Intermediate Modern Fortran course. If you work on HPC code you may also find the ARCHER2 MPI and OpenMP courses linked below useful.

```mermaid
flowchart TD
    accTitle: Learner Pathways for the Introduction to Modern Fortran Course
    accDescr {This diagram shows the possible learning pathways after completing the Introduction to Modern Fortran course.
    The Intermediate and Advanced Topics in Modern Fortran courses are in the pre-alpha stage.
    The MPI and OpenMP courses are from ARCHER2, the UK's national supercomputing facility, courses.}
    A["Introduction to Modern Fortran <br>(this course)"] --> B
    B[Intermediate Modern Fortran] --> C & D & E
    C[Advanced Topics<br>in Modern Fortran]
    D[Message-passing<br>Programming with MPI]:::archer2
    E[Shared Memory<br>Programming with OpenMP]:::archer2
    classDef archer2 stroke:#64c2ab
    click D href "https://www.archer2.ac.uk/training/courses/#message-passing-programming-with-mpi" "Link to the MPI Archer2 Course"
    click E href "https://www.archer2.ac.uk/training/courses/#shared-memory-programming-with-openmp" "Link to the OpenMP Archer2 Course"
```
