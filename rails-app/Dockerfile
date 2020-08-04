FROM ruby:2.7.1

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN apt-get update \
    && apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
    && apt-get install -y \
                        sudo \
                        gcc \
                        g++ \
                        ruby \
                        ruby-dev \
                        make \
                        sqlite3 \
                        libsqlite3-dev \
                        sqlite-dev \
                        yarn \
                        nodejs \
    && gem install bundler \
    && bundle install \
    && yarn install \
    && rm -r /var/lib/apt/lists/* 
    

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]

