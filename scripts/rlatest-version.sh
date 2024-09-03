#!/usr/local/bin/bash

source $BOXCAR_SCRIPT_HOME/common.sh

declare profile

function parse_cli {
	for arg in "$@"; do # transform long options to short ones
		shift
		case "$arg" in
			"--profile")   set -- "$@" "-p" ;;
			*)             set -- "$@" "$arg"
		esac
	done

	# Parse command line options safely using getops
	while getopts "p:" opt; do
		case $opt in
			p) profile=$OPTARG ;;
			\?)
				echo "Invalid option: $OPTARG" >&2
				exit;
				;;
		esac
	done
}

main() {
  aws ecr describe-images --repository-name platform \
    --profile $profile \
    --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'
}

parse_cli "$@"
check_cli "profile"
main