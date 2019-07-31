FROM alpine:latest
MAINTAINER Daniel Yuan <danielyuan.me>

# Build Arguments
ARG GID
ARG UID
ARG USER

# Install Dependencies
RUN apk -U --no-progress upgrade && \
  apk -U --no-progress add taskd taskd-pki

# Setup User
RUN addgroup --gid "$GID" "$USER" \
    && adduser \
    --disabled-password \
    --gecos "" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"

RUN mkdir /taskd && \
    mkdir -p /app/taskd

USER taskd-service
ENTRYPOINT ["sh", "/app/taskd/run.sh"]
