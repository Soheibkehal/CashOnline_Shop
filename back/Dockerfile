FROM maven:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN chmod +x /app/start.sh

ENTRYPOINT ["sh", "/app/start.sh"]