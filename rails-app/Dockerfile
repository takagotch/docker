FROM ruby:2.7.1-alpine

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN apk update \
    && apk add --no-cache gcc g++ make sqlite-dev yarn nodejs \
    && gem install bundler \
    && bundle install \
    && yarn install

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]
