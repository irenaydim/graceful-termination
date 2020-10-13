# Pass target CPU architecture as build argument or fallback to 'amd64' as default
ARG ARCH=amd64

# Production image
FROM $ARCH/alpine:3.10

# Copy scripts
RUN mkdir -p /app
COPY src/p1.js /app/p1.js
COPY src/p2.js /app/p2.js
COPY scripts/entrypoint.sh /app/entrypoint.sh

# Add packages
WORKDIR /app
RUN apk add --no-cache \
        nodejs \
        bash

# Start main process
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
