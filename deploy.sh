#!/usr/bin/bash

# This script deploys site to staging or production depending on which branch is the current context.

# rsync
# -a : archive mode, archive mode allows copying files recursively and it also preserves symbolic links, file permissions, user & group ownerships and timestamps
# -z : compress file data
# -v : verbose
# -P : same as --partial --progress
# --delete: remove files from dest that are not in src
# --filter: filter files on dest (used to protect blog files from being deleted)
# --exclude: exclude files from src from the transfer
# --include: include files from src for transfer

if [[ $TRAVIS_BRANCH = "master" ]] ; then

  echo '_____ Setup deployment key for staging server'
  chmod 600 deploy_key.stage
  mv deploy_key.stage ~/.ssh/id_rsa

  echo '_____ Syncing files to staging'
  rsync -azvP site/ user@stage.server.com:path/to/web/dir

elif [[ $TRAVIS_BRANCH = "live" ]] ; then

  echo '_____ Setup deployment key for production server'
  chmod 600 deploy_key.prod
  mv deploy_key.prod ~/.ssh/id_rsa

  echo '_____ Syncing files to production'
  rsync -azvP --dry-run src/ travisci@server.com:path/to/web/dir

else
  echo 'Invalid branch. You can only deploy from master or live.'
  exit 1
fi
