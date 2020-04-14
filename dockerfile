# Base Image
FROM ruby:2.6.3

# Create app directory
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.1.4

RUN bundle install

COPY . .

# Confirm that all files are copied
RUN ls -la ./*

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]