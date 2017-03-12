FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle update && bundle install
ADD . /myapp
ENTRYPOINT ["puma"]
