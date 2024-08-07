ARG BASE_IMAGE=ghcr.io/hyperk/hk-pilot:main
FROM ${BASE_IMAGE}

COPY . /usr/local/hk/hk-software

ARG GIT_USERNAME
ARG GIT_TOKEN
RUN git config --global url."https://${GIT_USERNAME}:${GIT_TOKEN}@git.hyperk.org/".insteadOf "https://git.hyperk.org/"

WORKDIR /usr/local/hk
RUN . /usr/local/hk/hk-pilot/setup.sh &&\
    hkp install -r hk-software &&\
    hkp select --all &&\
    hkp install hk-ToolApp &&\
    hkp clean --src --build ROOT &&\
    hkp clean --src --build Geant4 &&\
    hkp clean --src --build ToolFrameworkCore

RUN git config --global --unset url."https://${GIT_USERNAME}:${GIT_TOKEN}@git.hyperk.org/".insteadOf
