ARG BUILD_IMAGE=node:20.1.0
ARG RUN_IMAGE=gcr.io/distroless/nodejs20-debian11

# Prepare production dependencies
FROM $BUILD_IMAGE AS deps-env
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Create final production stage
FROM $RUN_IMAGE AS run-env
WORKDIR /usr/app
COPY --from=deps-env /node_modules ./node_modules
COPY index.js ./index.js
COPY package.json ./

ENV NODE_ENV="production"
CMD ["index.js"]