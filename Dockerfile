FROM openshift/ubi8-openjdk-11-runtime:1.10

# install some of the basics our environment will need (seem to need `libssl-dev` and `libcurl4-openssl-dev` for one of the R packages)
RUN yum --disableplugin=subscription-manager install -y git \
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