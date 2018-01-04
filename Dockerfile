FROM ruby
MAINTAINER Nikita-Boyarskikh <N02@yandex.ru>

RUN apt-get update -qq && \
    apt-get install -y \
        build-essential \
        libpq-dev \
        nodejs \
        locales \
        sphinxsearch && \
    locale-gen en_US.UTF-8 && \
    ln -s /usr/bin/nodejs /usr/bin/node

ENV RAILS_ENV=production \
    RACK_ENV=production \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    WEB_ROOT=/QuestionsAndAnswers

RUN mkdir -p $WEB_ROOT
WORKDIR $WEB_ROOT

COPY Gemfile $WEB_ROOT/Gemfile
COPY Gemfile.lock $WEB_ROOT/Gemfile.lock
RUN bundle install

COPY . $WEB_ROOT