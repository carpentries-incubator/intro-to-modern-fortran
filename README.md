# Introduction to Modern Fortran

This is the lesson repository for Introduction to Modern Fortran.
This lesson is currently in pre-alpha development by the
[Edinburgh Parallel Computing Centre][epcc-link],
the [National Centre for Atmospheric Science][ncas-link],
the [National Oceanography Centre][noc-link],
and the [Met Office][uk-met-link].

## Contributing

If you would like to help build this course please see
the discussion on [Contributing](https://github.com/carpentries-incubator/intro-to-modern-fortran/discussions/39)
and the [Curriculum Outline](https://github.com/carpentries-incubator/intro-to-modern-fortran/discussions/6#discussioncomment-8546839).
We have monthly co-working sessions which are posted on
[Discussions](https://github.com/carpentries-incubator/intro-to-modern-fortran/discussions/categories/meetings?discussions_q=is%3Aopen+category%3AMeetings).

General Notes:

- Please use a fork to contribute
- Any Fortran code should follow the agreed style (Met Office)
- If you are adding new exercises or data please re compress
  the `exercises.tar.gz` file. In the root dir of this repo:

```bash
tar czf episodes/data/exercises.tar.gz exercises/
```

- Ensure new exercises and exercise updates are also updated
  in the corresponding `exercises/<episode_name>/README.md`

[Notes from RSECon23](https://pad.archer2.ac.uk/p/rsecon23-fortran)

## Docker

This repo utilises docker to provided a reproducible environment for learners to complete the exercises

### Building the docker images

There is a parent Dockerfile (See [.devcontainer/Dockerfile](.devcontainer/Dockerfile)) which every other Dockerfile extends.
This is build within a [GitHub workflow](.github/workflows/docker_build_parent_exercises_image.yaml) and stored within the
GitHub container registry. Therefore, the parent image must be built at least once before the images used for testing can be built.

### devcontainer

Provided in this repo is a [devcontainer setup](./.devcontainer/). This devcontainer allows working with the repo within a
pre-defined Docker environment with all of the necessary dependencies installed. There are two convenient ways to use the
devcontainer. You can clone the repo and then run the container locally using
[VSCode's devcontainer functionality](https://code.visualstudio.com/docs/devcontainers/containers). Another, perhaps more
convenient, method is to use [GitHub codespaces](https://github.com/features/codespaces).

> To use the local VSCode method, you will require [Docker](https://www.docker.com/) installed on your local machine.

#### GitHub Codespaces

To open a GitHub Codespace for this repository, select the `<> Code` drop-down within the home page of this repository. Then, from
the Codespaces tab, select `Create codespace on main`. This should open a new tab with a VSCode interface, running inside the
pre-built container. When you first create a codespace it may take a few moments to start up.

> Note that any codespace you create from the repository will be paid for out of
> [your monthly free allowance](https://docs.github.com/en/billing/concepts/product-billing/github-codespaces#monthly-included-storage-and-core-hours-for-personal-accounts)<!-- markdownlint-disable-line MD013 -->
> provided by GitHub. Therefore, make sure you [delete the codespace](https://docs.github.com/en/codespaces/developing-in-a-codespace/deleting-a-codespace)<!-- markdownlint-disable-line MD013 -->
> when you are done. You can check your running codespaces at [github.com/codespaces](https://github.com/codespaces)
