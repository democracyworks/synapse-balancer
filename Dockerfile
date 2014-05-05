FROM democracyworks/base
MAINTAINER Democracy Works, Inc. <dev@turbovote.org>

RUN apt-get install -y haproxy ruby1.9.1 ruby1.9.1-dev patch make

RUN gem install synapse

RUN echo ENABLED=1 > /etc/default/haproxy

ADD /start-synapse.sh /start-synapse.sh
ADD /supervisord-synapse.conf /etc/supervisor/conf.d/supervisord-synapse.conf
ADD /conf.json /conf.json
RUN mkdir /var/haproxy/

EXPOSE 80
