# Dockerfile to create image with cron services
FROM ubuntu:latest
#MAINTAINER it-boutique.ru

# Add the script to the Docker Image
ADD balance.sh /root/balance.sh
ADD balance.py /root/balance.py

# Give execution rights on the cron scripts
RUN chmod +x /root/balance.sh

#Install Cron
#ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata cron postgresql-client curl jq bc software-properties-common

RUN ln -fs /usr/share/zoneinfo/Europe/Samara /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

ENV TZ="Europe/Samara"

# Create the log file to be able to run tail
RUN touch /var/log/cron.log


# Add the cron job
#RUN crontab -l | { cat; echo "* * * * * bash /root/balance3.sh > /root/cron.log 2>&1"; } | crontab -
RUN (crontab -l ; echo "* * * * * bash /root/balance.sh >> /var/log/cron.log") | crontab
RUN (crontab -l ; echo "* * * * * python3 /root/balance.py >> /var/log/script.log") | crontab

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log


