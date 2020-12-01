#!/bin/bash

# add user and group as container start
# BUILDER_UID=$(id -u)
# BUILDER_GID=$(id -g)
BUILDER_USER="adam"
BUILDER_GROUP="adam"

if [[ -n $BUILDER_UID ]] && [[ -n $BUILDER_GID ]]; then

  groupadd -o -g $BUILDER_GID $BUILDER_GROUP 2> /dev/null
  useradd -o -m -g $BUILDER_GID -u $BUILDER_UID $BUILDER_USER 2> /dev/null
  
  chown $BUILDER_UID:$BUILDER_GID $WORK
  
  chroot --userspec=$BUILDER_UID:$BUILDER_GID --skip-chdir / "$@"
else
  exec "$@"
fi

