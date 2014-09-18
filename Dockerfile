FROM ubuntu
MAINTAINER ian@blenke.com

RUN export DEBIAN_FRONTEND=noninteractive && \
    set -x && \
    apt-get update && \
    apt-get install -y iptables fail2ban && \
    cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local && \
    mkdir -p /etc/fail2ban/jail.d /var/run/fail2ban && \
    echo -e "[DEFAULT]\nbackend=systemd" > /etc/fail2ban/jail.d/systemd.conf

CMD /usr/bin/fail2ban-server -f
