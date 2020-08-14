#!/bin/bash

if [ $# == 0 ]; then
        echo "No IP address provided to ban!"
        exit 1
else
        echo "Banning ${1} from access to this server."

        RESULT=$(ufw status | grep -w "${1}" | awk '{ print $3 }')

        if [ -z "${RESULT}" ]; then
                ufw insert 1 deny from ${1} to any &>/dev/null
        else
                echo "IP ${1} already present in firewall."
        fi
fi
