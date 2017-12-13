FROM golang:1.8
COPY . "$GOPATH/src/agenda-go-server"
RUN cd "$GOPATH/src/agenda-go-server/cli" && go get -v && go install -v
RUN cd "$GOPATH/src/agenda-go-server/service" && go get -v && go install -v
WORKDIR /
EXPOSE 8080
VOLUME ["/data"]
