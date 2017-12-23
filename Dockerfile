FROM node:carbon-alpine
ENV NODE_ENV production

WORKDIR /usr/src/app
RUN yarn global add nodemon
COPY ["package.json", "yarn.lock", "./"]
RUN yarn --production && mv node_modules ../
COPY ./src/. .

RUN addgroup -g 901 -S system && adduser -u 902 -S -g system app
USER app
EXPOSE 8000
CMD node --experimental-modules app.js

