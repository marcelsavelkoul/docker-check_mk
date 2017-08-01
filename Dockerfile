FROM progrium/busybox

MAINTAINER marcel.savelkoul@gmail.com

RUN /usr/bin/opkg-install procps bash curl xinetd

RUN /usr/bin/curl -k -L https://github.com/marcelsavelkoul/docker-check_mk/raw/master/files/check-mk-agent_1.2.6p16-1_all.tar.gz | gunzip | tar -xpC /

ENTRYPOINT [ "/usr/sbin/xinetd", "-f", "/etc/xinetd.conf", "-dontfork", "-stayalive" ]
