#!/bin/bash

# add user and group as container start
# BUILDER_UID=$(id -u)
# BUILDER_GID=$(id -g)
BUILDER_USER="adam"
BUILDER_GROUP="adam"

if [[ -n $BUILDER_UID ]] && [[ -n $BUILDER_GID ]]; then

  groupadd -o -g $BUILDER_GID $BUILDER_GROUP 2> /dev/null
  useradd -o -m -g $BUILDER_GID -u $BUILDER_UID $BUILDER_USER 2> /dev/null
  
  export HOME=/home/${BUILDER_USER}
  
  chown $BUILDER_UID:$BUILDER_GID $WORK
  
  chown root:$BUILDER_GID $(which gosu)
  chmod +s $(which gosu); sync
  
  exec gosu $BUILDER_UID:$BUILDER_GID "$@"
else
    # Just run the command as root.
    exec "$@"
fi
