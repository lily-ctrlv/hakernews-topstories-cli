FROM ruby:2.5

RUN mkdir -p /usr/src/app
ADD . /usr/src/app

WORKDIR /usr/src/app
RUN BUNDLE INSTALL


CMD "ruby ./src/hackernews.rb"
