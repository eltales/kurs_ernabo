FROM nginx:stable

COPY app /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
