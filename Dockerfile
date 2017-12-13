FROM golang:1.8
COPY . "/home/stonelm/Desktop/gocode/agenda-go-service-master"
RUN cd "/home/stonelm/Desktop/gocode/agenda-go-service-master/cli" && go get -v && go install -v
RUN cd "/home/stonelm/Desktop/gocode/agenda-go-service-master/service" && go get -v && go install -v
WORKDIR /
EXPOSE 8080
VOLUME ["/data"]
