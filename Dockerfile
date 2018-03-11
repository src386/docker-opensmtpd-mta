# docker-opensmtpd-mta
#
FROM alpine:latest

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

CMD ["/usr/sbin/smtpd","-d"]
