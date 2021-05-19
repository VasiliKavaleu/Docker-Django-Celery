FROM python:3

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY entrypoint.sh ./
RUN chown root entrypoint.sh
RUN chmod +x entrypoint.sh

RUN apt-get update
RUN pip install -r requirements.txt
RUN apt-get -y install netcat

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

