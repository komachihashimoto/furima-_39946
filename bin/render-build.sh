#!/usr/bin/env bash
# exit on error
set -o errexit
sed -i 's/\r//' /bin/render-build.sh

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate