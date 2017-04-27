FROM alpine:3.5
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

RUN apk update && apk upgrade
RUN apk add --update haproxy ruby ruby-dev ruby-io-console build-base \
    libxml2-dev libxslt-dev zlib-dev patch make git && rm -rf /var/cache/apk/*
RUN mkdir -p /var/haproxy

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install bundler
RUN bundle config build.nokogiri --use-system-libraries

RUN mkdir -p /usr/src/synapse-balancer
WORKDIR /usr/src/synapse-balancer

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --system

COPY start-synapse.sh start-synapse.sh
COPY conf conf

EXPOSE 80
EXPOSE 8080

ENTRYPOINT ["/usr/src/synapse-balancer/start-synapse.sh"]

CMD ["config.json"]
