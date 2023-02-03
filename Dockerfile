# this will get replaced on OpenShift so we need to use RHEL commands
FROM debian:bullseye

# install some of the basics our environment will need (seem to need `libssl-dev` and `libcurl4-openssl-dev` for one of the R packages)
RUN rpm -i git.rpm
RUN rpm -i docker.rpm
RUN rpm -i docker-compose.rpm
RUN rpm -i pip.rpm
RUN rpm -i python3-venv.rpm

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