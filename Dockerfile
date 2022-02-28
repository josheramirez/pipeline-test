FROM node:14.15 as build

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run prod

FROM nginx:1.19

COPY --from=build /app/dist/pipeline-test/ /usr/share/nginx/html

