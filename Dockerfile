FROM alpine:3.3
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

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --system

ADD start-synapse.sh start-synapse.sh
ADD conf1.json conf1.json
ADD conf2.json conf2.json
ADD conf3.json conf3.json

EXPOSE 80
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

CMD ["/usr/src/synapse-balancer/start-synapse.sh"]
