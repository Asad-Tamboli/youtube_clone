FROM nginx:latest
WORKDIR /app
RUN test -f /etc/nginx/conf.d/default.conf && rm /etc/nginx/conf.d/default.conf || echo "File not found, skipping"
#RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
COPY . /app
EXPOSE 80

