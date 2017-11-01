FROM circleci/node:8.8.1-browsers

USER root

#
# rsync 3.1.1-3
#
RUN RSYNC_VER="3.1.1-3" \
 && apt-get -qq update \
 && apt-get install -y rsync=$RSYNC_VER

#
# python pip 9.0.1-2 && aws-cli 1.11.159 && aws-eb-cli 3.10.6
# (pip uninstall docker-py as it conflicts with docker-compose)
#
RUN PIP_VER="9.0.1-2" \
 && AWSCLI_VER="1.11.159" \
 && AWSEBLI_VER="3.10.6" \
 && echo "deb http://deb.debian.org/debian stretch main contrib" > /etc/apt/sources.list.d/stretch.list \
 && apt-get -qq update \
 && apt-get install -y python-pip=$PIP_VER \
 && pip install awscli==$AWSCLI_VER \
 && pip install awsebcli==$AWSEBLI_VER \
 && pip uninstall -y docker-py \
 && rm -rf /var/lib/apt/lists/*

USER circleci

SHELL ["/bin/bash"]
ENTRYPOINT ["/bin/bash"]
