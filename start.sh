#!/bin/sh

# Generate config
if [ ! -f /haraka/config/smtp.ini ]; then
  haraka -i /haraka
fi

# Specify hostname
echo $VIRTUAL_HOST > /haraka/config/me

if [ ! -f /haraka/config/tls.ini ]; then
  touch /haraka/config/tls.ini
  printf "key=/etc/letsencrypt/live/$VIRTUAL_HOST/key.pem\ncert=/etc/letsencrypt/live/$VIRTUAL_HOST/fullchain.pem" > /haraka/config/tls.ini
fi
#if [ ! -f /haraka/config/tls/tls-key.pem ]; then
  # Get and install certificates from Let's Encrypt
  #certbot certonly -n --agree-tos -d "$HOSTNAME"
#  mkdir -p /haraka/config/tls
#  cd /haraka/config/tls
#  cp -r /etc/letsencrypt/live/$VIRTUAL_HOST/ ./
  #ln -s /etc/letsencrypt/live/$VIRTUAL_HOST/key.pem tls-key.pem
  #ln -s /etc/letsencrypt/live/$VIRTUAL_HOST/fullchain.pem tls-cert.pem
#  cd -
#fi

haraka -c /haraka

