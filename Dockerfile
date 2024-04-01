FROM alpine/git:latest

RUN apk --no-cache add bash

LABEL "com.github.actions.name"="checkout-external-repo-action"
LABEL "com.github.actions.description"="Checks out a external repository and possibly runs additional commands on it"
LABEL "com.github.actions.icon"="git-pull-request"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="https://github.com/leberechtreinhold/checkout-external-repo-action"
LABEL "homepage"="https://github.com/leberechtreinhold/checkout-external-repo-action"
LABEL "maintainer"="Aitor Jiménez Yañez <aitor@ajimenez.es>"


COPY entrypoint.sh /entrypoint.sh
COPY cred-helper.sh /cred-helper.sh
ENTRYPOINT ["/entrypoint.sh"]