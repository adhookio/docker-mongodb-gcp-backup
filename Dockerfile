  
FROM mongo

RUN apt-get update && apt-get install curl -qq --no-install-recommends

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get install gpg -qq --no-install-recommends \
    && apt-get install apt-transport-https ca-certificates gnupg -qq --no-install-recommends 

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update && apt-get install google-cloud-sdk -qq --no-install-recommends

ADD main.sh /root/main.sh
ADD .boto /root/.boto

RUN chmod 777 /root/main.sh

WORKDIR /

CMD ["/root/main.sh"]