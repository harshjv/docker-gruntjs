FROM phusion/baseimage:0.9.16
MAINTAINER Harsh Vakharia <harshjv@gmail.com>

# Default baseimage settings
ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]
ENV DEBIAN_FRONTEND noninteractive

# Update software list
RUN apt-get update

# Install nodejs
RUN apt-get install -y nodejs

# Install npm
RUN apt-get install -y npm

# Install gruntjs
RUN npm install -g grunt-cli

# Remove cache
RUN apt-get clean
RUN rm -rf                                    /var/lib/apt/lists/* \
                                              /tmp/* \
                                              /var/tmp/*

# Configure nodejs
RUN ln -s                                     /usr/bin/nodejs /usr/bin/node

# Add gruntjs volume
VOLUME ["/var/gruntjs"]

# Set WORKDIR
WORKDIR /var/gruntjs

# Set grunt as default command
CMD grunt
