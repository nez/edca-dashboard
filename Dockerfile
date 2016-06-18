FROM node:argon

WORKDIR /edca-dashboard

ADD . /edca-dashboard

RUN npm install

EXPOSE 4000

CMD ["./bin/www"]