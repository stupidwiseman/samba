FROM debian:stable-slim

COPY start.sh /start.sh

RUN apt-get update && apt-get -y upgrade \
&&  DEBIAN_FRONTEND=noninteractive \
&&  apt-get -y install \
    samba \
    samba-common-bin \
    smbclient \
    krb5-user \
    winbind \
    libpam-winbind \
    libnss-winbind \
&&  apt-get clean autoclean \
&&  apt-get autoremove --yes \
&&  rm -rf /var/lib/{apt,dpkg,cache,log}/ \
&&  rm -fr /tmp/* /var/tmp/*

CMD [ "/bin/sh", "/start.sh" ]