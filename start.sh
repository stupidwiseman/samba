#!/bin/bash

# Variable parameters

ADMIN=${ADMIN:-administrator}
PASSWORD=$PASSWORD
JOIN=$(net ads testjoin)

# Join to the Active Directory domain
if [[ $JOIN != "Join is OK" ]]; then
    echo -e "$PASSWORD\n$PASSWORD" | net ads join -U $ADMIN
fi

# Service start
service smbd start
service winbind start

/bin/bash