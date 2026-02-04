FROM nginx:latest

COPY app /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
