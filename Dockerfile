# BUILD PHASE
FROM node:14-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build
# /app/build <--- Build production directory

# RUN PHASE
FROM nginx
# COPY FROM BUILDER PHASE
COPY --from=builder /app/build /usr/share/nginx/html
