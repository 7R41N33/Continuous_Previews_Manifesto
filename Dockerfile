FROM node:16.13

RUN apk update \
  && apk add --no-cache \
    bash \
    git \
    jq \
    ncurses \
    vim \
&& rm /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app

COPY package.json yarn.lock ./

ADD . /app

RUN yarn

RUN yarn build

EXPOSE 3000

CMD yarn start
