#!/bin/bash

echo "127.0.0.1 stage-decouverte.epfl.ch" >> /etc/hosts

service ssh start

if ! pgrep -x "sshd" > /dev/null; then
    echo "Erreur: SSH n'a pas démarré correctement"
    exit 1
fi

echo "SSH démarré avec succès"

apachectl -D FOREGROUND