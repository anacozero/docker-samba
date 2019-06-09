FROM ubuntu:latest


ENV DEBIAN_FRONTEND=noninteractive

ENV TZ 'America/Chicago'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
	apt-get --no-install-recommends install -y \
        nano \
        ntp \
	samba \
	samba-dsdb-modules \
        samba-client \
        samba-vfs-modules \
        krb5-user \
        libpam-krb5 \
        winbind \
        libnss-winbind \
        libpam-winbind \
	acl \
	attr \
	
        

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	
EXPOSE 445/tcp 139/tcp 137/udp 138/udp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD []
