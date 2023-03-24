#!/bin/bash

cd $(git rev-parse --show-toplevel)


# eval "$(conda shell.bash hook)"
# conda activate experiment_management_demo
export PYTHONPATH=.:$PYTHONPATH

export EXPERIMENT_COMMENT="This is an example experiment"

echo "Running $0 from $(pwd)"
echo
echo "Comment:"
echo "${EXPERIMENT_COMMENT}"
echo
echo "Commands:"

tail -n +$(expr $LINENO + 8) $0 | grep -v '^#' | grep -v '^$'

# Confirmation prompt based on https://stackoverflow.com/a/1885534
echo; read -p "Continue? (y/N): " -n 1 -r; echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborting run"
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

# 03/24/23

python3 script.py --handle example

# 03/23/23

# python3 script.py --handle old_example
