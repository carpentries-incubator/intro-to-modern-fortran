# Extend the base image for running a devcontainer within vscode.
ARG DEBIAN_VERSION=bookworm
FROM mcr.microsoft.com/vscode/devcontainers/base:$DEBIAN_VERSION

# Install dependencies (compilers, openmpi, git, etc)
RUN apt update
RUN apt upgrade -y
RUN apt install -y --no-install-recommends \
gfortran git wget cmake python3-pip m4 openmpi-bin openmpi-doc libopenmpi-dev
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Create symlink to python3 as some tools expect a python executable which doesn't exist by default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Allow MPI to oversubscribe
ENV OMPI_MCA_rmaps_base_oversubscribe=true

# Switch to the pre-existing vscode user to limit permissions
USER vscode
WORKDIR /home/vscode/

# Install fortls to enable Fortran VSCode extension
RUN python3 -m pip install fortls --break-system-packages

# Build pfunit using custom script
COPY scripts/build-pfunit.sh /home/vscode/build-pfunit.sh
RUN /home/vscode/build-pfunit.sh -b -p /home/vscode/pfunit

# Test pFUnit build
RUN /home/vscode/build-pfunit.sh -t -p /home/vscode/pfunit

# Store path to pFUnit installed directory for easy access later
ENV PFUNIT_INSTALLED_PATH=/home/vscode/pfunit/build/installed
