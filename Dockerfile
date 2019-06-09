FROM ubuntu:latest


ENV DEBIAN_FRONTEND=noninteractive

ENV TZ 'America/Chicago'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
	apt-get install -y \
        nano \
        ntp \
		samba \
        krb5-user \
        libpam-krb5 \
        winbind \
        libnss-winbind \
        libpam-winbind
        

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	
EXPOSE 445/tcp 139/tcp 137/udp 138/udp

ENTRYPOINT ["smbd", "--foreground", "--log-stdout"]

CMD []
