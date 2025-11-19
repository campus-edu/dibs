# Use Alpine Linux for a lightweight image
FROM alpine:latest

# PocketBase version
ARG PB_VERSION=0.22.21

# Install necessary dependencies
RUN apk add --no-cache \
    unzip \
    ca-certificates

# Download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# Copy index.html to the public directory so it's served at the root URL
COPY index.html /pb/pb_public/index.html

# Expose port 8090
EXPOSE 8090

# Start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]
