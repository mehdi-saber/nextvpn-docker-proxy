FROM alpine:3.10.3
EXPOSE 8080
RUN apk --update add privoxy openvpn
COPY . /app
WORKDIR /app/
RUN mkdir -p /app-config/ && \
    echo "username" > /app-config/openvpn-credentials.txt && \
    echo "password" >> /app-config/openvpn-credentials.txt && \
    chmod 600 /app-config/openvpn-credentials.txt
ENTRYPOINT \
    nohup openvpn --config Germany-TCP.ovpn && \
    nohup sh privoxy.sh && \
    tail -f nohup.out