FROM bitwalker/alpine-elixir:1.8.0

ENV REFRESHED_AT=2019-04-17

LABEL maintainer="brandon@uptrend.tech"

RUN apk --no-cache add  libcrypto1.0 libssl1.0

RUN \
  sed -i 's/v3.8/v3.9/g' /etc/apk/repositories && \
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
COPY --from=surnet/alpine-wkhtmltopdf:3.7-0.12.4-small /bin/wkhtmltopdf /bin/
RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    # libcrypto1.1 libssl1.1 \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family
