#!/bin/sh
#

# What this script does:
# - Generate a 10y self-signed certificate unless provided
# - Set MAILNAME in /etc/mailname

# Detect if PluXml has existing data
if [ ! -e "/etc/ssl/certs/crt.pem" ]; then
    echo "No certificate found. Generating a 10y self-signed..."
    mkdir /etc/ssl/private
    openssl req -new -x509 -days 3650 -nodes -sha256 \
    -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" \
    -out /etc/ssl/certs/crt.pem \
    -keyout /etc/ssl/private/key.pem \
    && chmod 644 /etc/ssl/certs/crt.pem \
    && chmod 640 /etc/ssl/private/key.pem
fi

# Set hostname in /etc/mailname
echo "$MAILNAME" > /etc/smtpd/mailname

exec "$@"
