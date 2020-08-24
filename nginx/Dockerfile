FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/public
RUN chmod -R 755 /var/www/public

EXPOSE 9000


