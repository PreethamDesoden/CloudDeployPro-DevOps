# ============================================
# STAGE 1: Build the React application
# ============================================
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy all source code
COPY . .

# Build the React application
RUN npm run build

# ============================================
# STAGE 2: Production runtime
# ============================================
FROM node:18-alpine

WORKDIR /app

# Install serve to run the built app
RUN npm install -g serve

# Copy ONLY the build output from stage 1
COPY --from=builder /app/build ./build

# Expose port
EXPOSE 3000

# Serve the application
CMD ["serve", "-s", "build", "-l", "3000"]