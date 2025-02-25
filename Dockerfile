FROM nginx:latest
WORKDIR /app
RUN test -f /etc/nginx/conf.d/default.conf && rm /etc/nginx/conf.d/default.conf || echo "File not found, skipping"
#RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
COPY . /app
EXPOSE 80
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
