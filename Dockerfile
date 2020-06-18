  
FROM mongo

RUN apt-get update \
    && apt-get install git -qq --no-install-recommends \
    && apt-get install python-pip -qq --no-install-recommends \
    && apt-get install python-setuptools -qq --no-install-recommends \
    && pip install python-dateutil \
    && git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd \
    && ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

ADD main.sh /opt/main.sh

RUN chmod 777 /opt/main.sh

WORKDIR /

CMD ["/opt/main.sh"]