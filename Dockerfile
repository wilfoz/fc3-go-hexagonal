FROM golang:1.16

WORKDIR /go/src
ENV GOPATH=/home/www-data/go
ENV GOCACHE=/home/www-data/go/.cache
ENV PATH="/home/www-data/go/bin:${PATH}"

RUN go install github.com/spf13/cobra-cli@latest && \
    go install github.com/golang/mock/mockgen@v1.5.0

RUN apt-get update && apt-get install sqlite3 -y

RUN usermod -u 1000 www-data

RUN chown www-data:www-data -R /home/www-data/go  
USER www-data

CMD ["tail", "-f", "/dev/null"]