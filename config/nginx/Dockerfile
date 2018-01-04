FROM nginx
MAINTAINER Nikita-Boyarskikh <N02@yandex.ru>

ENV NGINX_HOST=queueoverflow.ru
ENV WEB_ROOT=/QuestionsAndAnswers

RUN apt-get update -qq && \
    apt-get install cron python-certbot-nginx -y

RUN mkdir -p /tmp$WEB_ROOT /var/lib/nginx $WEB_ROOT/log && \
    rm -f /etc/nginx/conf.d/* && \
    certbot -n --nginx python-certbot-nginx -d www.$NGINX_HOST -d $NGINX_HOST --agree-tos --email N02@yandex.ru

COPY . /tmp$WEB_ROOT
WORKDIR /tmp$WEB_ROOT

RUN crontab - crontab && \
    sed "s|NGINX_HOST|$NGINX_HOST|g" nginx.conf | sed "s|WEB_ROOT|$WEB_ROOT|g" > /etc/nginx/nginx.conf
