FROM hexpm/elixir:1.9.4-erlang-22.3.4.1-alpine-3.11.6

ENV REFRESHED_AT=2020-06-15

LABEL maintainer="jason.grey@warecorp.com"

RUN \
  addgroup -S appgroup && \
  adduser --system appuser --ingroup appgroup

RUN apk --no-cache add  libcrypto1.1 libssl1.1

RUN \
  # Add pinned repos for access to newer packages. More info: https://bit.ly/2PfS8K0
  echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
  echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  apk upgrade && \
  apk --no-cache add \
    # Distillery needs bash now
    bash \
    # Used to fetch EC2 instance IP before launch. Busybox provides wget, but
    # it requires openssl, which is a bigger install
    curl

# Install wkhtmltopdf
# copies static binary from docker image and install it's dependencys
COPY --from=surnet/alpine-wkhtmltopdf:3.10-0.12.6-small /bin/wkhtmltopdf /bin/
RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family
