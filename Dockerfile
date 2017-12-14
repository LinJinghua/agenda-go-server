FROM golang:1.8

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

RUN go get -v github.com/LinJinghua/agenda-go-server | true
RUN mv "$GOPATH/src/github.com/LinJinghua/agenda-go-server" "$GOPATH/src/agenda-go-server"
RUN cp -r "$GOPATH/src/agenda-go-server/cli" "$GOPATH/src/agenda-go-cli"

RUN ls src/agenda-go-server
RUN ls src/agenda-go-cli

RUN go get -v agenda-go-cli
RUN go install agenda-go-cli

RUN go get -v agenda-go-server/service
RUN go install agenda-go-server/service
CMD ["service"]
