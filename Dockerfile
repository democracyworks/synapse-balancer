FROM quay.io/democracyworks/base:latest
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

RUN apt-get update && apt-get install -y haproxy ruby1.9.1 ruby1.9.1-dev patch make git

RUN gem install bundler
ADD Gemfile /Gemfile
ADD Gemfile.lock /Gemfile.lock
RUN bundle install --system

RUN echo ENABLED=1 > /etc/default/haproxy

ADD /start-synapse.sh /start-synapse.sh
ADD /conf.json /conf.json
RUN mkdir /var/haproxy/

EXPOSE 80

CMD ["/start-synapse.sh"]
