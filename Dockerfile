FROM node:alpine3.18

# Build App

WORKDIR /App

COPY package.josn .

RUN npm install

COPY . .

RUN npm run build

# Serve with nginx
FROM nginx:1.23-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf *

COPY --from=build-stage /app/build .

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "doemon" ]

