FROM golang:1.8
COPY . "$GOPATH/src/agenda-go-service-master"
RUN cd "$GOPATH/src/agenda-go-service-master/cli" && go get -v && go install -v
RUN cd "$GOPATH/src/agenda-go-service-master/service" && go get -v && go install -v
WORKDIR /
EXPOSE 8080
VOLUME ["/data"]
