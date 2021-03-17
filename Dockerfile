ARG BUILD_FOR
FROM eclipse-mosquitto:2.0.9-openssl AS amd64
FROM arm64v8/eclipse-mosquitto:2.0.9-openssl AS arm64

FROM ${BUILD_FOR} AS final
COPY PreUpdate.sh /
RUN chmod +x PreUpdate.sh
RUN apk add --no-cache curl
LABEL com.centurylinklabs.watchtower.lifecycle.pre-update="/PreUpdate.sh"
LABEL com.centurylinklabs.watchtower.lifecycle.pre-update-timeout=190
LABEL org.opencontainers.image.source https://github.com/yrien30/mosquitto
EXPOSE 8883:8883/tcp