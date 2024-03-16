#!/bin/sh

if [ $ADSJOIN != "false" ]; then
    if [ $REALM != "false" ]; then
        samba-tool domain provision --use-rfc2307 --realm=$REALM --domain=$DOMAINNM --server-role=member --dns-backend=SAMBA_INTERNAL --adminpass=$PASSWORD
        net ads join -U $ADMIN --password $ADUPASSWORD
    else
        echo "変数REALMを設定してください"
    fi
fi
# Service start
service smbd restart
service winbind restart

/bin/bash