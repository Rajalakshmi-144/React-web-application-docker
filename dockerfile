# Use Nginx to serve the React build
FROM nginx:alpine
# Set the working directory in the container
WORKDIR /usr/share/nginx/html 
# Remove the default Nginx index.html
RUN rm -rf /usr/share/nginx/html/*
# Copy the build folder to the Nginx default folder
COPY build/ /usr/share/nginx/html/
# Expose port 80 to the outside world
EXPOSE 80
# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

