FROM alpine

#### Example configuration ####
# HOST      = smtp.gmail.com  #    
# PORT      = 587             #
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

# -------------- #
# ENV variables  #
# -------------- #
ENV SSMTP_CONF='/etc/ssmtp'

# ------------- #
# Install ssmtp #
# ------------- #
RUN apk update \
  && apk add ssmtp mailutils \
  && mkdir -p /opt/mail

# -------------------- #
# Copy config template #
# -------------------- #
COPY ssmtp_custom.conf ${SSMTP_CONF}/ssmtp_custom.conf

WORKDIR /opt/mail
ENTRYPOINT ["sh, "/entrypoint.sh"]