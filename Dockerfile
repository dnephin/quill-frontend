#
# 
#

FROM   node:5.6 
RUN    npm -g install \
            bower \
            browserify \
            coffee-script \
            gulp \
            less
WORKDIR /code            
