#
# 
#

FROM    ubuntu:14.10

MAINTAINER Daniel Nephin

RUN     apt-get update && apt-get install -y \
            npm \
            nodejs

RUN     ln -s /usr/bin/nodejs /usr/local/bin/node

RUN     npm -g install \
            bower \
            gulp \
            coffee-script

