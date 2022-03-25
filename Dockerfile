# Envvars:
# * electricsheep-hd-client-apikey: The API key (required)
FROM ruby:slim-buster AS cpu
RUN apt-get update
RUN apt-get install -y flam3
# TODO: clean up apt remanents

WORKDIR /opt/electricsheep
COPY . .
RUN bundle install

# Disable the auto-updater
ENV electricsheep-hd-client-updated=true

VOLUME /opt/electricsheep/branches

CMD ["/opt/electricsheep/daemon", "--no-progress"]
