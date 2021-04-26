# Envvars:
# * electricsheep-hd-client-apikey: The API key (required)
FROM ruby:slim-buster AS cpu
RUN apt-get update
RUN apt-get install -y flam3
# TODO: clean up apt remanents

WORKDIR /opt/electricsheep
COPY . .
RUN bundle install
RUN ln -s /data/branches /opt/electricsheep/branches
RUN ln -s /data/active-season /opt/electricsheep/.active-season
RUN ln -s /opt/electricsheep/container-entrypoint.sh /entrypoint

# Disable the auto-updater
ENV electricsheep-hd-client-updated=true

VOLUME /data
ENTRYPOINT ['/entrypoint']
CMD ['/opt/electricsheep/daemon', '--no-progress']
