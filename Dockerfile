FROM ruby:3.0.0-buster

WORKDIR /usr/src/app
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . .
CMD ["rails", "s", "-b", "0.0.0.0"]
