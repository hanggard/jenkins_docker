FROM jenkins:latest
LABEL maintainer "hanggard@gmail.com"
EXPOSE 8080 50000
USER root
RUN apt-get update && apt-get install -y apt-transport-https software-properties-common
RUN add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
RUN curl -L https://cli-assets.heroku.com/apt/release.key | apt-key add - && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y python-pip python-dev heroku sendmail xvfb libyaml-dev jq build-essential libssl-dev libffi-dev yarn
RUN pip install awscli cryptography ansible
