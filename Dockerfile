# use base
FROM node:16-alpine as builder

WORKDIR /app

COPY ./package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
#epxose used by aws to expose 80 to outside network
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

