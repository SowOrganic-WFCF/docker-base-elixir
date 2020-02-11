FROM uptrend/base-elixir:1.3.0

ENV REFRESHED_AT=2020-02-11

LABEL maintainer="brandon@uptrend.tech"

# Install Node and NPM
# make and g++ is for compilation of native modules for Elixir (and possibly node)
# grep is added because Ranch doesn't like alpine's grep -E
# bash is added because Distillery requires it
# inotify-tools is added for live reload
RUN \
  mkdir -p /app && \
  chown -R appuser:appgroup /app && \
  apk --no-cache --update --purge upgrade && \
  apk --no-cache --update add \
    git \
    make \
    g++ \
    grep \
    nodejs@edge \
    yarn@edgecommunity \
    inotify-tools \
  && \
  update-ca-certificates --fresh && \
  rm -rf /var/cache/apk/*

RUN \
  mix local.hex --force && \
  mix local.rebar --force

ENV PATH=./node_modules/.bin:$PATH
