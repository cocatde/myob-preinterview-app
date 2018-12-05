FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y libpq-dev

#Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir /app
ADD . /app
WORKDIR /app

CMD ["./scripts/start"]