#!/bin/bash

export CA_ROOT=./myCA
OPENSSL_CNF=./myopenssl.cnf


# clean CA directory
/bin/rm -rf ${CA_ROOT}

# create directory structure
# (this must match the settings in your configuration file)
/usr/bin/mkdir -p ${CA_ROOT}
/usr/bin/mkdir -p ${CA_ROOT}/private
/usr/bin/mkdir -p ${CA_ROOT}/certs
/usr/bin/mkdir -p ${CA_ROOT}/newcerts


/usr/bin/pwgen -1 > ${CA_ROOT}/private/ca-password.txt
/usr/bin/chmod 0400 ${CA_ROOT}/private/ca-password.txt

# Generate an RSA private key using default parameters:
# openssl genpkey -algorithm RSA -out ${CA_ROOT}/private/ca-private-key.pem

# Generate an RSA private key using default parameters and encrypt it with a passphrase stored in file ${CA_ROOT}/private/ca-password.txt
openssl genpkey -algorithm RSA -out ${CA_ROOT}/private/ca-private-key.pem -aes-128-cbc -pass file:${CA_ROOT}/private/ca-password.txt