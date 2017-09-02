FROM debian:stretch
MAINTAINER Vladimir Goshev <sunx@sunx.name>

RUN apt-get update && apt-get install -y tor && \
	\
	rm -rf /var/lib/apt && \
	mkdir -p /var/run/tor && chown debian-tor:debian-tor /var/run/tor && chmod 0700 /var/run/tor && \
	\
	echo Done!


COPY docker-run-root.sh /bin/docker-run-root
COPY torrc /var/tmp/torrc

VOLUME /var/lib/tor

# Container will run some preparations with root access (fixing permissions, for example)
#   and then execute /bin/docker-run with user access to configure (if needed) and run
#		Services
CMD ["/bin/docker-run-root"]
