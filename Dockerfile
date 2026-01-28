FROM nginx

COPY app /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
