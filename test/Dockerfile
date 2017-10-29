FROM ruby:2.4.1-slim

COPY test-chiquito-app /test-chiquito-app

WORKDIR /test-chiquito-app
RUN chmod 777 /test-chiquito-app/cuke.sh
CMD ./cuke.sh
