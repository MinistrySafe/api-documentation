FROM ruby:2.5
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs
COPY . /usr/src/app/
RUN gem install bundler
RUN apt-get autoremove -y
WORKDIR /usr/src/app/
RUN bundle install
EXPOSE 4567
CMD ["bundle", "exec", "middleman", "server"]
