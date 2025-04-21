# Use an official lightweight Nginx image as a base
# Nginx is a popular, efficient web server. 'alpine' is a small version.
FROM nginx:stable-alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove the default Nginx welcome page files (optional but clean)
RUN rm -f index.html 50x.html

# Copy your Chessboard.html file into the Nginx web root directory
# We rename it to 'index.html' so Nginx serves it by default when someone visits '/'
COPY Chessboard.html index.html

# Tell Docker that the container will listen on port 80 at runtime
# This is the default port Nginx listens on. Render will map this.
EXPOSE 80

# The base nginx image already has a command to start nginx in the foreground
# So we don't strictly need a CMD or ENTRYPOINT here unless overriding.
# Default CMD is usually ["nginx", "-g", "daemon off;"]