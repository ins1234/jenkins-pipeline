FROM node:12.10-alpine
WORKDIR /usr/src/app
COPY package.json ./
RUN sudo apt-get update
RUN sudo apt-get install docker-ce docker-ce-cli containerd.io
RUN npm install
COPY . .
EXPOSE 3000
CMD npm start
