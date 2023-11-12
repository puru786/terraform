# Use an official Nginx image.
# https://hub.docker.com/_/nginx
FROM nginx:latest

# Copy the static HTML files to the Nginx container
COPY ./nginx/* /usr/share/nginx/html

# Make port 80 available to the world outside this container
EXPOSE 80

# Run Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]