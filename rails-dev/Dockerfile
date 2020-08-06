FROM ruby:2.7.1-alpine

RUN apk add --no-cache bash
RUN apk add --update \
  build-base \
  ruby-nokogiri \
  nodejs \
  git \
  libxml2-dev \
  libxslt-dev \
  sqlite-dev \
  && rm -rf /var/cache/apk/*

EXPOSE 3000

RUN mkdir /myapp
WORKDIR /usr/src/app

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

COPY ./entrypoint.sh /etc/entrypoint.sh
RUN chmod +x /etc/entrypoint.sh
CMD ["/bin/sh"]
ENTRYPOINT ["/etc/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
