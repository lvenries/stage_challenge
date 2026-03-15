FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 openssh-server sudo iputils-ping gnupg nano vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash stage && \
    echo "stage:secret123" | chpasswd && \
    usermod -aG sudo stage

RUN mkdir /var/run/sshd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

COPY files/motd.txt /etc/motd
COPY files/un_bon_debut.txt /home/stage/un_bon_debut
COPY files/une_bonne_suite.txt /var/une_bonne_suite
COPY files/fichier_secret.txt /home/stage/.fichier_secret
COPY files/fichier_admin.txt /home/stage/fichier_admin
COPY scripts/script_a_modifier.sh /home/stage/script_a_modifier
COPY files/echo.txt /etc/echo.txt
COPY files/cowsay.txt /tmp/cowsay.txt

RUN cd /tmp && tar -czf mystere.tar.gz cowsay.txt && mv mystere.tar.gz /opt/ && rm cowsay.txt

RUN chown stage:stage /home/stage/un_bon_debut /home/stage/.fichier_secret /home/stage/script_a_modifier && \
    chown root:root /home/stage/fichier_admin && \
    chmod 600 /home/stage/fichier_admin && \
    chmod +x /home/stage/script_a_modifier

COPY scripts/create_gpg.sh /tmp/create_gpg.sh
RUN chmod +x /tmp/create_gpg.sh && /tmp/create_gpg.sh && rm /tmp/create_gpg.sh

COPY files/index.html /var/www/html/index.html
COPY scripts/start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80 22

CMD ["/start.sh"]