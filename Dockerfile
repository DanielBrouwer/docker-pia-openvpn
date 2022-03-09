FROM alpine:latest

RUN apk add --no-cache openvpn
RUN apk add dos2unix

COPY pia /pia
WORKDIR /pia
COPY openvpn.sh /usr/local/bin/openvpn.sh

RUN dos2unix /usr/local/bin/openvpn.sh

ENV REGION="netherlands"
ENTRYPOINT ["openvpn.sh"]
