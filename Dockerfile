FROM google/cloud-sdk:alpine
RUN apk add maven && apk add docker && apk add openjdk8 && gcloud components install kubectl
