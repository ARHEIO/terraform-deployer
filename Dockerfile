FROM hashicorp/terraform

RUN apk add --no-cache \
      vim \
      bash \
      curl \
      docker-cli \
      docker-compose \
      jq \
      make
