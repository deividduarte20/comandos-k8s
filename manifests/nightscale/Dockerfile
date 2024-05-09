FROM debian

USER root
WORKDIR /app
COPY nightscale.sh .
RUN apt update && apt install jq curl -y && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin

CMD ["/bin/bash", "/app/nightscale.sh"]