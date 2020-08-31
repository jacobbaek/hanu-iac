#!/bin/bash

# below link, you can find how to config the role and ldap.toml file
# https://grafana.com/docs/grafana/latest/auth/ldap/

kubectl create secret generic ldap-toml --from-file=./ldap-toml -n lma

