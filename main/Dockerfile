FROM bitwalker/alpine-elixir:1.6.1

ENV REFRESHED_AT=2018-02-21 
 
LABEL maintainer="brandon@uptrend.tech"

# Install Node and NPM
# make and g++ is for compilation of native modules for Elixir (and possibly node)
# grep is added because Ranch doesn't like alpine's grep -E
# bash is added because Distillery requires it
# inotify-tools is added for live reload
RUN \
  mkdir -p /app && \
  chown -R default:0 /app && \
  apk --no-cache --update --purge upgrade && \
  apk --no-cache --update add \
    git \
    make \
    g++ \
    grep \
    bash \
    nodejs \
    yarn \
    inotify-tools \
  && \
  update-ca-certificates --fresh && \
  rm -rf /var/cache/apk/*

# Install wkhtmltopdf
# copies static binary from docker image and install it's dependencys
COPY --from=surnet/alpine-wkhtmltopdf:3.7-0.12.4-small /bin/wkhtmltopdf /bin/
RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    libcrypto1.0 libssl1.0 \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family

RUN \
  mix local.hex --force && \
  mix local.rebar --force

ENV PATH=./node_modules/.bin:$PATH
