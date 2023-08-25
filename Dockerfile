FROM ghcr.io/hyperk/hk-pilot:main

RUN --mount=type=ssh mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

COPY . /usr/local/hk/hk-software

WORKDIR /usr/local/hk
RUN echo "  FLOWER: git@github.com:HKDAQ/FLOWER.git" >> /usr/local/hk/hk-pilot/data/repos.yaml
RUN --mount=type=ssh . /usr/local/hk/hk-pilot/setup.sh &&\
    hkp install -r hk-software &&\
    true
RUN chmod +x /usr/local/hk/hk-software/entrypoint.sh
ENTRYPOINT ["/usr/local/hk/hk-software/entrypoint.sh"]
CMD ["/bin/bash"]

