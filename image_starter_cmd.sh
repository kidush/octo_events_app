#!/usr/bin/env bash

# Migrating the database
rake db:migrate

# start rails
RAILS_ENV=$RAILS_ENV bundle exec puma -p 4200 -e $RAILS_ENV -C config/puma.rb
