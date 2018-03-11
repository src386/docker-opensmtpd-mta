# [![OpenSMTPD_logo][opensmtpd-logo]](https://opensmtpd.org/) docker-opensmtpd-mta

*OpenSMTPD as a simple MTA to send emails*

[![RSS commits][rss-commits]](https://github.com/src386/docker-opensmtpd-mta/commits/master.atom)

[opensmtpd-logo]: https://raw.githubusercontent.com/src386/docker-opensmtpd-mta/master/lib/images/opensmtpd-logo-small.png
[rss-commits]: https://img.shields.io/badge/RSS-commits-orange.svg

In a Docker environment, [OpenSMTPD][opensmtpd] is way more simple and lightweight than postfix, especially for MTA usage. Works great paired with docker-pluxml.

You can find out more about OpenSMTPD on the [project's website][opensmtpd].

[opensmtpd]: https://opensmtpd.org/

## Supported tags and respective `Dockerfile` links

- [`latest`][dockerfile-latest] ([Dockerfile][dockerfile-latest])

[dockerfile-latest]: https://github.com/src386/docker-opensmtpd-mta/blob/master/Dockerfile

## Quick start

Pull the image and fire up a OpenSMTPD-mta container:

    docker pull src386/docker-opensmtpd-mta
    docker run -p 25:25 \
     -e MAILNAME=example.org \
     -d src386/docker-opensmtpd-mta:latest

Or, using docker-compose (recommended):

    version: '3'
    services:

      opensmtpd-mta:
        image:
          src386/docker-opensmtpd-mta:latest
        ports:
          - "127.0.0.1:25:25"
        environment:
          - MAILNAME=example.org

Then fire up a OpenSMTPD-mta container:

    docker-compose up -d

Features
--------

- Currently based on alpine
- TLS support, a 10y self-signed certificate is generated on startup if none is present

Development
-----------

    git clone https://github.com/src386/docker-opensmtpd-mta
    cd docker-opensmtpd-mta && docker build -t docker-opensmtpd-mta:latest

Or you may want to use the docker-compose.yml file:

    git clone https://github.com/src386/docker-opensmtpd-mta
    cd docker-opensmtpd-mta/5.6 && docker-compose build

Configuration
-------------

List of environment variables:

- MAILNAME: (required) the fqdn that `smtpd` will use when talking to other servers.

## FAQ

## Licensing

MIT.
You can find full text of the license in the [LICENSE][license] file.

[license]: https://github.com/src386/docker-opensmtpd-mta/blob/master/LICENSE
