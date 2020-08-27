FROM alpine

#### Example configuration ####
# HOST      = smtp.gmail.com  #    
# PORT      = 465             #
# AUTH_USER = xyz@gmail.com   #
# AUTH_PASS = xyz             #
# TLS       = YES/NO          #
###############################

# ------------------- #
# Docker image labels #
# ------------------- #
LABEL description="Docker image for sending mails to external smtp servers" \
 vendor="Marcel Andree" \
 maintainer="marcel@andree.cloud"

# ------------- #
# Install ssmtp #
# ------------- #
RUN apk update \
  && apk add ssmtp mutt ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /opt/mail

# -------------------- #
# Copy config template #
# -------------------- #
COPY ssmtp_custom.conf /etc/ssmtp/ssmtp_custom.conf
COPY revaliases_custom /etc/ssmtp/revaliases_custom
COPY entrypoint.sh /entrypoint.sh

WORKDIR /opt/mail
ENTRYPOINT ["sh", "/entrypoint.sh"]
