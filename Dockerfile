FROM alpine:3.3

ADD .gemrc ~/.gemrc
RUN apk add --no-cache ruby
RUN apk add --no-cache curl
RUN curl -o `ruby -ropenssl -e 'p OpenSSL::X509::DEFAULT_CERT_FILE' |tr -d \"` http://curl.haxx.se/ca/cacert.pem

RUN "Ruby version: `ruby --version`"

EXPOSE 80

ADD . /app
WORKDIR /app
RUN gem install rdoc bundler
RUN bundler install
RUN rake db:seed


