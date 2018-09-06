FROM artifactory.global.standardchartered.com/bitwalker/alpine-elixir-phoenix:latest

ENV http_proxy "http://10.65.128.43:8080"
ENV https_proxy "http://10.65.128.43:8080"

RUN mix archive.install --force  https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mkdir /app
COPY src /app
WORKDIR /app