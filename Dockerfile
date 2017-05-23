FROM ndslabs/cloud9-python


RUN apt-get -qq update -y && \
    apt-get -qq install -y \
        postgresql-client \
        libpq-dev \
        python-dev  \
        python3-dev &&  \
    apt-get -qq autoremove && \
    apt-get -qq autoclean && \
    apt-get -qq clean all && \
    rm -rf /var/cache/apk/* && \
    cd / && git clone https://github.com/craig-willis/stromatolites_demo && \
    cd stromatolites_demo/ && make

COPY ./entrypoint.sh /
CMD [ "/entrypoint.sh" ]
