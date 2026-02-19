FROM rocker/shiny:latest

RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev

COPY . /srv/shiny-server/

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]
