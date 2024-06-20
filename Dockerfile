FROM node:alpine3.18

# Build App

WORKDIR /app

COPY package.josn .

RUN npm install

COPY . .

RUN npm run build


# Serve with nginx
# FROM nginx:1.23-alpine

# WORKDIR /usr/share/nginx/html

# RUN rm -rf *

# COPY --from=build-stage /app/ /usr/share/nginx/html

# EXPOSE 80

# ENTRYPOINT [ "nginx", "-g", "doemon off;" ]


FROM nginx:1.24-alpine3
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build-stage /app/build /usr/share/nginx/html
EXPOSE 80
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

