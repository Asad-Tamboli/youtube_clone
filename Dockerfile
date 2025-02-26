FROM nginx:latest
WORKDIR /app
RUN test -f /etc/nginx/conf.d/default.conf && rm /etc/nginx/conf.d/default.conf || echo "File not found, skipping"
COPY nginx.conf /etc/nginx/conf.d/
COPY . /app
EXPOSE 8080
