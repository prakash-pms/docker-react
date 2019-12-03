
FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .
CMD npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
