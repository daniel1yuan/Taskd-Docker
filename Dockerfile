FROM alpine:latest
MAINTAINER Daniel Yuan <danielyuan.me>

# Install Dependencies
RUN apk -U --no-progress upgrade && \
  apk -U --no-progress add taskd taskd-pki

# Setup User
ENV USER=taskd-service
ENV UID=53589
ENV GID=53589

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

VOLUME /var/taskd

# Copy Entrypoint
COPY ./taskd/run.sh /app/taskd/run.sh

# Setup permissions
RUN chown -R :53589 /taskd && \
    chown -R :53589 /app/taskd

RUN chmod 775 /taskd && \
    chmod 775 /app/taskd

run chmod g+s /taskd

USER taskd-service

RUN ls -ld /taskd

EXPOSE 53589
ENTRYPOINT ["sh", "/app/taskd/run.sh"]


