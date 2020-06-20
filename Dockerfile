FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3000/tcp
RUN npm run build

#/app/build -- thats the folder we care for after the build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

