#!/usr/local/bin/bash

if [ "x$CONTAINER_SCRIPT_HOME" == "x" ]; then
        echo "Please set CONTAINER_SCRIPT_HOME"
        exit 1;
fi

source $BOXCAR_SCRIPT_HOME/common.sh
source $CONTAINER_SCRIPT_HOME/common.sh
source $CONTAINER_SCRIPT_HOME/common-opts.sh
source $CONTAINER_SCRIPT_HOME/common-repo.sh

main() {
        echo "kubectl set image deployments/platform-deployment platform=$tag"
}

check_cli "version"
main