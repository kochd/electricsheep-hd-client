FROM ruby:slim-buster
RUN apt-get update && apt-get install -y flam3
# TODO: clean up apt remanents
WORKDIR /opt/electricsheep-hd-client
COPY . .
RUN bundle install

# Disable the auto-updater
ENV electricsheep-hd-client-updated=1

CMD ['/opt/electricsheep-hd-client/daemon']
