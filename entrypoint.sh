#!/bin/bash

echo "This is the hk-software entrypoint"

echo "Sourcing hk-pilot and hk-software setup.sh"
source /usr/local/hk/hk-pilot/setup.sh
source /usr/local/hk/hk-software/install-$(hkp --system)/setup.sh

echo "HK pilot has been sourced. For usage see:\n   hkp --help"
echo "The HK software has been sourced."

# Then run the CMD
exec "$@"
