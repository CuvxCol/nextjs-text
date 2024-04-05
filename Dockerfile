# Use the official Node.js image as builder stage
FROM node:18-alpine AS builder
# Set the working directory inside the builder stage container
WORKDIR /builder
# Copy all files from the current directory into the builder stage container
COPY . .
# Install dependencies using npm ci to ensure exact dependencies are installed
RUN npm ci
# Build the Next.js application
RUN npm run build

# Start a new stage with another Node.js image as runner stage
FROM node:18-alpine AS runner
# Set the working directory inside the runner stage container
WORKDIR /app
# Copy package.json and package-lock.json files from the builder stage into the runner stage container
COPY --from=builder /builder/package*.json ./
# Copy the .next directory (built Next.js application) from the builder stage into the runner stage container
COPY --from=builder /builder/.next ./.next
# Copy the next.config.mjs file from the builder stage into the runner stage container
COPY --from=builder /builder/next.config.mjs ./
# Copy the public directory from the builder stage into the runner stage container
COPY --from=builder /builder/public ./public
# Copy the node_modules directory from the builder stage into the runner stage container
COPY --from=builder /builder/node_modules ./node_modules

# Expose port 3000 to allow communication to the Next.js application
EXPOSE 3000

# Specify the default command to run when the container starts
CMD ["npm", "start"]
