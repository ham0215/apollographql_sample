FROM ruby:2.7.0

RUN apt-get update && apt-get install -y \
    vim \
    locales \
    locales-all \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem update bundler
RUN bundle install
COPY . .

RUN rm -f /app/tmp/pids/server.pid

CMD ["rails", "s", "-b", "0.0.0.0"]
