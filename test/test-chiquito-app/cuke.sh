#!/bin/bash

bundle install --path=vendor && bundle exec cucumber -p docker
