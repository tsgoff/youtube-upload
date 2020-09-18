FROM python:3.8.5-alpine3.12

ENV workdir /data
WORKDIR ${workdir}

RUN mkdir -p ${workdir} && adduser python --disabled-password
COPY . ${workdir}
WORKDIR ${workdir}
RUN pip install --upgrade google-api-python-client oauth2client progressbar2 && \
    python setup.py install && echo "google-api-python-client==1.7.4" > pip-requirements.txt && \
    pip install -r pip-requirements.txt

USER python

ENTRYPOINT ["youtube-upload"]
