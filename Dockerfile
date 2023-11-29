FROM python:3.7.17-alpine3.18
# add `gcc musl-dev linux-headers python3-dev` to see if it resolves the error with installing acryl-datahub (it seems to fix the issue)
# added docker and docker-compose so we can run the quickstart.sh script from this file***
RUN apk update && apk add git gcc musl-dev linux-headers python3-dev docker docker-compose

# trying to clone the code
RUN git clone https://github.com/kuhlaid/datahub.git --branch master --single-branch

RUN python3 -m venv venv
#     # the `source` command needs the bash shell
# SHELL ["/bin/bash", "-c"]
# CMD ["/bin/sh"]
RUN source venv/bin/activate

RUN python3 -m pip install --upgrade pip wheel setuptools
RUN python3 -m pip install --upgrade acryl-datahub
# RUN datahub version                    # does not work
# RUN "./datahub/docker/quickstart.sh"   # does not work

# ENV HOME /datahub
# WORKDIR /datahub/docker

# this combines shell commands into one line (checking datahub version, changing to the docker directory, and running the quickstart)
# RUN /bin/sh -c set -eux; datahub version; 
# RUN /bin/sh -c set -eux; cd ./datahub/docker; pwd; ls; 
# RUN /bin/sh -c set -eux; quickstart.sh;  # does not work
#chmod +x quickstart.sh


# ENTRYPOINT ["quickstart.sh"]
# CMD datahub version

# this lists the root contents
# CMD ls

# this should run the shell command but for some reason it says it is not found (which is not true)
# CMD ["sh", "./datahub/docker/quickstart.sh"]

# run bash ./datahub/docker/quickstart.sh

CMD datahub docker quickstart