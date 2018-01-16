FROM node:6

# General packages update
RUN apt-get update

# Installing Redis and main components (chain and tools)
RUN apt-get install -y redis-server python build-essential automake autoconf libtool jq

# Installing FreeGeoIP
RUN wget https://github.com/fiorix/freegeoip/releases/download/v3.1.5/freegeoip-3.1.5-linux-amd64.tar.gz
RUN tar -zxf freegeoip-3.1.5-linux-amd64.tar.gz
RUN ln -s freegeoip-3.1.5-linux-amd64 freegeoip
RUN nohup /freegeoip/freegeoip > ./freegeoip/freegeoip.log 2>&1 &

# Installing Grunt.js
RUN npm install -g grunt

# Installing PM2
RUN npm install -g pm2

# Installing PM2-Logrotate
RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:max_size 100M

# Installing Git
RUN apt-get install -y git

# Cloning Lisk Explorer
RUN git clone https://github.com/enricofoschi/dpos-explorer.git
WORKDIR /dpos-explorer

RUN npm install -g bower
RUN npm install

# Creating assets bundle
RUN npm run build

# Entrypoint
ADD ./entrypoint.sh /dpos-explorer/entrypoint.sh
CMD ./entrypoint.sh
