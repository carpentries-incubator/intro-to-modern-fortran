ARG DEBIAN_VERSION=bookworm

FROM mcr.microsoft.com/vscode/devcontainers/base:$DEBIAN_VERSION

RUN apt update
RUN apt upgrade -y
RUN apt install -y --no-install-recommends \
gfortran git wget cmake python3-pip m4 openmpi-bin openmpi-doc libopenmpi-dev
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Create symlink to python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Allow MPI to oversubscribe
ENV OMPI_MCA_rmaps_base_oversubscribe=true

USER vscode

WORKDIR /home/vscode/

# Install fortls to enable Fortran VSCode extension
RUN python3 -m pip install fortls --break-system-packages

# Build pfunit
COPY scripts/build-pfunit.sh /home/vscode/build-pfunit.sh
RUN /home/vscode/build-pfunit.sh -b -p /home/vscode/pfunit

# Test pFUnit build
RUN /home/vscode/build-pfunit.sh -t -p /home/vscode/pfunit

ENV PFUNIT_INSTALLED_PATH=/home/vscode/pfunit/build/installed
