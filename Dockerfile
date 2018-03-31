FROM ruby
MAINTAINER Nikita-Boyarskikh <N02@yandex.ru>

ENV RAILS_ENV=production \
    RACK_ENV=production \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    WEB_ROOT=/QuestionsAndAnswers

RUN mkdir -p $WEB_ROOT
WORKDIR $WEB_ROOT

COPY config/requirements.txt /tmp$WEB_ROOT/

RUN apt-get update -qq && \
    apt-get install -y < /tmp$WEB_ROOT/requirements.txt && \
    ln -s /usr/bin/nodejs /usr/bin/node

COPY Gemfile $WEB_ROOT/Gemfile
COPY Gemfile.lock $WEB_ROOT/Gemfile.lock
RUN gem install rubygems-bundler && \
    gem regenerate_binstubs && \
    bundle install

COPY . $WEB_ROOT
