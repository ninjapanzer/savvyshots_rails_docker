FROM ubuntu:14.04

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

### Base Setup with elixir and erlang
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y git
RUN apt-get install -y curl
RUN curl -sSL https://get.rvm.io | bash

### Setup Site
RUN mkdir /var/web
RUN git clone https://github.com/ninjapanzer/savvyshots_rails.git savvyshots
RUN cd savvyshots
RUN rvm reload
RUN bundle install

WORKDIR /

ENV PORT 8888

EXPOSE 8888

WORKDIR /var/web/savvyshots

CMD ["rel/contact_form_micro_service/bin/contact_form_micro_service", "start"]
