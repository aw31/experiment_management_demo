#!/bin/bash

# Sync log files from remote to local using rsync

LOCAL=$(git rev-parse --show-toplevel)
REMOTE=shadowfax:experiment_management_demo/

# rsync dry run that includes directories and logfiles and excludes everything else
rsync --dry-run -avzh --prune-empty-dirs --include="*/" --include="*.log" --exclude="*" $REMOTE $LOCAL

# Confirmation prompt based on https://stackoverflow.com/a/1885534
echo; read -p "Continue with sync? (y/N): " -n 1 -r; echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborting sync"
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

rsync -avzh --prune-empty-dirs --include="*/" --include="*.log" --exclude="*" $REMOTE $LOCAL
