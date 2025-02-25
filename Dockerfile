FROM nginx:latest
WORKDIR /
RUN test -f /etc/nginx/conf.d/default.conf && rm /etc/nginx/conf.d/default.conf || echo "File not found, skipping"
COPY nginx.conf /etc/nginx/conf.d/
COPY . /app
EXPOSE 80 8080

# Start Gunicorn in the background
CMD ["sh", "-c", "gunicorn -b 0.0.0.0:8080 app:app & nginx -g 'daemon off;'"]

