# Meta-package for HK Software stack

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
Then source the hk-pilot `setup.sh` and the hk-software `setup.sh`:

```bash
. /usr/local/hk/hk-pilot/setup.sh
. /usr/local/hk/hk-software/install-Linux_x86_64-gcc_8-python_3.8.13/setup.sh
```

From there, you should have access to all the software:

```bash
which WCSim
```
