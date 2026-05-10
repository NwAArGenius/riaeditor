FROM nginx:alpine

COPY . /usr/share/nginx/html/
RUN cp /usr/share/nginx/html/pdedit.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8082
