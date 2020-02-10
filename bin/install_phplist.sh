#!/usr/bin/env bash

if [ ! -d src ]; then
	echo "Composer installing phplist project";
	composer create-project -s dev --no-dev phplist/base-distribution src
else
	echo "Composer install in src";
	cd src && composer install
fi