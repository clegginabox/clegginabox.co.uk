FROM ghost:6.10.1-alpine

WORKDIR /var/lib/ghost

# Install the S3 Storage Adapter
RUN npm install ghost-storage-adapter-s3

# Ghost expects storage adapters to be in content/adapters/storage/<name>
RUN mkdir -p content/adapters/storage/s3 && \
    cp -r node_modules/ghost-storage-adapter-s3/* content/adapters/storage/s3/

# Cleanup
RUN npm cache clean --force
