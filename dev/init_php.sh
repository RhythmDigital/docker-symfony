#!/usr/bin/env bash
# Run in php container
composer install
npm install -g bower
npm install -g grunt-cli
bower install --allow-root
npm install
grunt
chown -R www-data:1000 web/_static