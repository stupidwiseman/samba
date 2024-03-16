#!/bin/sh

# Variable parameters

ADSJOIN=${ADSJOIN:-false}
REALM=${REALM:-false}
DOMAINNM=${DOMAINNM:-WORKGROUP}
ADMIN=${ADMIN:-administrator}
PASSWORD=${PASSWORD:-password}
ADUPASSWORD=${ADUPASSWORD:-password}

# Join to the domain if need join to active directory domain

if [ $ADSJOIN != "false" ]; then
    if [ $REALM != "false" ]; then
        service winbind stop
        service smbd stop
        rm /etc/samba/smb.conf
        samba-tool domain join $REALM MEMBER -U $ADMIN --password $ADUPASSWORD
    else
        echo "変数REALMを設定してください"
    fi
fi