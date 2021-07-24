FROM cirrusci/flutter:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN chmod +x /app/start.sh

RUN flutter clean

ENTRYPOINT ["sh", "/app/start.sh"]