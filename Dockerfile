FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /mock_coinhack
WORKDIR /mock_coinhack
COPY Gemfile /mock_coinhack/Gemfile
COPY Gemfile.lock /mock_coinhack/Gemfile.lock
RUN bundle install
COPY . /mock_coinhack