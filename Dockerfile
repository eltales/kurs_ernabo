FROM nginx:1.27

COPY app /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
