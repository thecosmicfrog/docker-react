#
# Multi-stage build Dockerfile.
#

FROM node:11.10-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# ^--- will go into /app/build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

