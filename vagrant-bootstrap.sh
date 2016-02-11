#!/usr/bin/env bash

pacman -Sy
pacman -Sy nodejs npm

npm install -g gulp
npm install -g bower

gem install bundler

PATH=$PATH:~/.gem/ruby/2.3.0/bin

# apt-get install -y apache2
# 
# if ! [ -L /var/www ]; then
#   rm -rf /var/www
#   ln -fs /vagrant /var/www
# fi

# Install Ruby 
# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm
# \curl -L https://get.rvm.io | bash -s stable
# source ~/.rvm/scripts/rvm
# rvm requirements
# rvm install ruby

# apt-get install -y ruby-rvm
# apt-get install -y nodejs
# apt-get install -y npm
# apt-get install -y gulp
# apt-get install -y bower
