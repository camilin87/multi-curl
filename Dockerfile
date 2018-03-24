FROM ruby:2.5

# RUN apt-get update && apt-get upgrade -y curl

RUN mkdir -p /var/mc/input/
RUN mkdir -p /var/mc/output/
RUN mkdir -p /var/mc/lib/

COPY src/*.rb /var/mc/
COPY src/lib/*.rb /var/mc/lib/

VOLUME ["/var/mc/input/", "/var/mc/output/"]

WORKDIR "/var/mc/"

ENTRYPOINT ["ruby", "/var/mc/program.rb", "/var/mc/output/", "/var/mc/input/urls.txt"]
