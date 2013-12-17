FROM        ubuntu:12.10

MAINTAINER  Adam Alexander, adamalex@gmail.com

# INSTALL OS DEPENDENCIES AND NODE.JS
RUN         apt-get update; apt-get install -y software-properties-common g++ make
RUN         add-apt-repository -y ppa:chris-lea/node.js
RUN         apt-get update; apt-get install -y nodejs
RUN         apt-get install -y git-core

RUN         npm install -g bower
RUN         npm install -g grunt

RUN 		cd /root; git clone https://github.com/timcash/oakleon
RUN 		cd /root; git clone https://github.com/timcash/oakleon_server

# INSTALL APP DEPENDENCIES
RUN         cd /root/oakleon_server; npm install
RUN         cd /root/oakleon; bower install
RUN         cd /root/oakleon; grunt build

EXPOSE 80

# EXECUTE NPM START BY DEFAULT
WORKDIR     /root/oakleon_server
ENTRYPOINT  ["/usr/bin/npm"]
CMD         ["start"]
