FROM postgres:latest
RUN apt update && apt install -y curl unzip && apt clean
COPY create_database.sh /docker-entrypoint-initdb.d/
