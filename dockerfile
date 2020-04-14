# Base Image
FROM ruby:2.6.3

RUN apt-get update && apt-get install -y \
	curl \
	build-essential \
	libpq-dev \
	nodejs \
	yarn 

# Create app directory
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.1.4

RUN bundle install

COPY . .

# Confirm that all files are copied
RUN ls -la ./*

ENV RAILS_ENV='development'
ENV RACK_ENV='development'

EXPOSE 3000

RUN bundle exec rails db:reset
RUN bundle exec rails db:migrate:reset

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0"]