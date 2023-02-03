# pull from https://hub.docker.com/_/debian/
# we need to use Debian bullseye v11
# FROM debian:bullseye
# ENV DEBIAN_FRONTEND noninteractive

# try this for OpenShift
FROM registry.access.redhat.com/ubi8/ubi:latest

# install some of the basics our environment will need (seem to need `libssl-dev` and `libcurl4-openssl-dev` for one of the R packages)
RUN apt-get update && apt-get install -y \
    git \
    docker \
    docker-compose \
    pip \
    python3-venv

# trying to clone the code
RUN git clone https://github.com/kuhlaid/datahub.git --branch master --single-branch

RUN python3 -m venv venv
#     # the `source` command needs the bash shell
SHELL ["/bin/bash", "-c"]
RUN source venv/bin/activate

RUN python3 -m pip install --upgrade pip wheel setuptools
RUN python3 -m pip install --upgrade acryl-datahub
CMD ["datahub version"]
CMD ["./datahub/docker/quickstart.sh"]