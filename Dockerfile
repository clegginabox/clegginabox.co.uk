FROM ghost:6.10.1-alpine

WORKDIR $GHOST_INSTALL/current

# Install the S3 Storage Adapter
RUN npm install ghost-storage-adapter-s3

RUN mkdir -p $GHOST_INSTALL/current/core/server/adapters/storage/s3 && \
    cp -r ./node_modules/ghost-storage-adapter-s3/* $GHOST_INSTALL/current/core/server/adapters/storage/s3

# Cleanup
RUN npm cache clean --force
