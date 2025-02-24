FROM nginx:latest
RUN sudo useradd -m appuser
USER appuser
WORKDIR /app
RUN chmod -R 777 /app
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
COPY . /app
EXPOSE 80

