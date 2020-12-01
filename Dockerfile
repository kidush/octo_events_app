FROM ruby:2.7.2
LABEL author="Thiago F. Lins"

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential libpq-dev nodejs

ENV INSTALL_PATH /var/www/app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY ./Gemfile ./Gemfile.lock ./

RUN gem install bundler
RUN bundle config set without 'test development'
RUN bundle config set path 'vendor/cache'
RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install
RUN bundle pack --quiet

COPY . ./

CMD [ "./image_starter_cmd.sh" ]




