# Stage 1: Copy files (organize workspace, optional stage)
FROM alpine:latest AS copy-stage

WORKDIR /site

# Copy all static files (html, css, js, images, etc.)
COPY . .

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy site content from previous stage
COPY --from=copy-stage /site /usr/share/nginx/html

# Expose default port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
