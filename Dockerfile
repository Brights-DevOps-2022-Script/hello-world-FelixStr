FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html
