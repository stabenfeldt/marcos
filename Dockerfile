FROM ruby:2.5.3-slim-stretch
LABEL maintainer="Martin Stabenfeldt <martin.stabenfeldt@shortcut.no>"

ENV INSTALL_PATH /app
WORKDIR $INSTALL_PATH

# Hack for cacheing the bundle install step
COPY Gemfile* $INSTALL_PATH/
ENV BUNDLE_GEMFILE=$INSTALL_PATH/Gemfile \
    BUNDLE_JOBS=4
#BUNDLE_PATH=/bundle

RUN apt-get update
RUN apt-get install -y        \
     ack-grep                 \
     build-essential          \
     curl                     \
     git                      \
     less                     \
     libgmp-dev               \
     liblzma-dev              \
     libpq-dev                \
     libxml2-dev              \
     libxslt-dev              \
     lsb-release              \
     patch                    \
     postgresql    \
     ruby-dev                 \
     vim                      \
     wget                     \
     zlib1g-dev

RUN gem install bundler
RUN bundle config git.allow_insecure true
RUN bundle install --jobs 20 --retry 5

COPY . $INSTALL_PATH

WORKDIR $INSTALL_PATH
ENV RAILS_ENV development

EXPOSE 3000

# ENTRYPOINT bundle exec puma -p 3000 -b 0.0.0.0
CMD ["/usr/local/bundle/bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
