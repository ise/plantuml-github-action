FROM ubuntu:bionic
# Current plantUML version at time of switch: PlantUML Version 1.2020.02
# Note: GitHub Actions must be run by the default Docker user (root). Ensure your Dockerfile does not set the USER instruction, otherwise you will not be able to access GITHUB_WORKSPACE.

RUN apt-get update \
    && apt-get install -y locales \
    && locale-gen ja_JP.UTF-8
RUN update-locale LANG=ja_JP.UTF-8 \
    && update-locale LANGUAGE="ja_JP:ja"
RUN apt-get install fonts-noto-cjk
# RUN apt install fonts-takao

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1

RUN apt-get -qy update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install plantuml graphviz git && \
    rm -rf /var/lib/apt/lists/*

ENV HOME_DIR /app

WORKDIR $HOME_DIR

# ENTRYPOINT ["plantuml"]
CMD ["/bin/bash"]
