FROM shortcutno/ubuntu-for-rails:0.2
LABEL maintainer="Martin Stabenfeldt <martin.stabenfeldt@shortcut.no>"

ENV INSTALL_PATH /app
WORKDIR $INSTALL_PATH

# Hack for cacheing the bundle install step
COPY Gemfile* $INSTALL_PATH/
ENV BUNDLE_GEMFILE=$INSTALL_PATH/Gemfile \
    BUNDLE_JOBS=4
#BUNDLE_PATH=/bundle

RUN gem install bundler
RUN bundle config git.allow_insecure true
RUN bundle install

COPY . $INSTALL_PATH

WORKDIR $INSTALL_PATH
ENV RAILS_ENV development
RUN rake db:reset
RUN rake db:create
RUN rake db:migrate

EXPOSE 3000

ENTRYPOINT bundle exec puma -p 3000 -b 0.0.0.0
