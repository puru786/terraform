# Use an official Nginx image.
FROM nginx:latest

# Copy the static HTML files to the Nginx container
COPY ./html /usr/share/nginx/html

# Change Nginx configuration to listen to port 8080
RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Change the ownership of the files
RUN chown -R 1001:0 /var/cache/nginx /var/run /usr/share/nginx/html && \
    chmod -R g+rwX /var/cache/nginx /var/run /usr/share/nginx/html

# Switch to non-root user
USER 1001

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
