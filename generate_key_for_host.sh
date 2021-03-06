#!/bin/bash

# this is a automatic cert generate script

openssl genrsa -out server.key 2048
openssl rsa -in server.key -out server.key
openssl req -sha256 -new -key server.key -out server.csr -subj "/CN=$1"
openssl x509 -req -sha256 -days 36500 -in server.csr -signkey server.key -out server.crt