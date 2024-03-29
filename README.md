# Meta-package for HK Software stack

## How to build hk-software Docker image locally

It is important to have things for building the image locally (assuming you have Docker installed on your machine):

-   Have BUILDKIT enabled (in most recent docker installation, this is enabled by default).
    This can be done by either doing `export DOCKER_BUILDKIT=1` or prepending the docker build command with `DOCKER_BUILDKIT=1` (like `DOCKER_BUILDKIT=1 docker build ...`)
-   Expose the ssh agent socket so that hk-pilot can use your ssh agent to clone the proper repositories e.g.
    ```bash
    docker build --ssh default .
    ```

Therefore the total command to be sure it will work is:
```bash
DOCKER_BUILDKIT=1 docker build --ssh default -t ghcr.io/hyperk/hk-software:latest .
```

## How to use hk-software using docker

Built images of hk-software are available on the GitHub Container Registry (GHCR): https://github.com/hyperk/hk-software/pkgs/container/hk-software
They should exist for each tagger version of hk-software, but also for the latest commit in the main branch.

To download them, you need to first login into GHRC (no need to redo this if done at least once):

```bash
docker login ghcr.io
```

It will ask for your GitHub username and a GitHub token (your GitHub password won't work).

From there, you can download the image e.g. version 0.0.2 and start a container:

```bash
docker pull ghcr.io/hyperk/hk-software:0.0.2
docker run --rm -it ghcr.io/hyperk/hk-software:0.0.2
```

Note the change of prompt.

As of 0.0.3, the hk-pilot and hk-software `setup.sh` scripts are automatically loaded when running the container.
From there, you should have access to all the software, e.g.:

```bash
which WCSim
```

If that were not the case, you can source the hk-pilot `setup.sh` and the hk-software `setup.sh`:

```bash
. /usr/local/hk/hk-pilot/setup.sh
. /usr/local/hk/hk-software/install-$(hkp --system)/setup.sh
```


