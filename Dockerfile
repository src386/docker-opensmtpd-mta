# docker-opensmtpd-mta
#
FROM alpine:latest

# Debug: Edge repositories
RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories

# Install opensmtpd
#
RUN set -xe; \
    \
    deps=' \
        ca-certificates \
        openssl \
    '; \
    \
    smtpd=' \
        opensmtpd \
    '; \
    \
    apk add --no-cache $smtpd $deps;

COPY smtpd.conf /etc/smtpd/

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/sbin/smtpd","-dv", "-T", "mta"]
