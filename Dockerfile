FROM ruby:2.7.1

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN apt-get update \
    && apt-get install -y gcc g++ make sqlite-dev yarn nodejs \
    && gem install bundler \
    && bundle install \
    && yarn install
    && apt-get clean && \
    # docker build -t rails-app . --no-cache
    rm -r /var/lib/apt/lists/* 
    

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]

