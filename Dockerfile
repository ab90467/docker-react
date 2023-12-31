FROM node:20-alpine3.18 as builder
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx:alpine3.18-slim
COPY --from=builder /app/build /usr/share/nginx/html
# nginx image has a default command to start nginx, so we don't need to specify it here

