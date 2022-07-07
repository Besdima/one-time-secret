#Build
FROM node:14
WORKDIR /usr/app
COPY package.json .
RUN npm install --quiet
COPY . .
RUN npm run build


#Env
ENV PUBLISH_SECRET_URI /new
ENV KEY_NAME_RANDOM_BYTES 10
ENV DOMAIN localhost:8080
ENV PORT 8080
ENV HTTP_TIMEOUT_MS 5000
ENV MAX_UPLOAD_KB 128

#Run
RUN npm install
CMD [ "node", "dist/bin/cli.js" ]