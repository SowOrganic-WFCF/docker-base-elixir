FROM bitwalker/alpine-elixir:1.6.1

ENV REFRESHED_AT=2018-02-21 
 
LABEL maintainer="brandon@uptrend.tech"

RUN \
  sed -i 's/v3.6/v3.7/g' /etc/apk/repositories && \
  echo "@edgetesting http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
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
    libcrypto1.0 libssl1.0 \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family
