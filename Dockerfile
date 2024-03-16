FROM debian:stable-slim

COPY init.sh /init.sh
COPY entrypoint.sh /entrypoint.sh

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
&&  /bin/sh /init.sh \
&&  apt-get clean autoclean \
&&  apt-get autoremove --yes \
&&  rm -rf /var/lib/{apt,dpkg,cache,log}/ \
&&  rm -fr /tmp/* /var/tmp/*

CMD [ "/bin/sh", "/entrypoint.sh" ]