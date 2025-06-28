# syntax=docker/dockerfile:1
FROM ruby:3.2

# Install required packages
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn \
    postgresql-client

# set working directory
WORKDIR /app

# copy gems
COPY Gemfile* ./

RUN bundle install

# copy the app
COPY . .

EXPOSE 3000

# use bin/dev for foreman
ENTRYPOINT ["bin/dev"]
