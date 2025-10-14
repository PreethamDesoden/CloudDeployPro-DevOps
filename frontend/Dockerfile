# Use Node.js as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all frontend code
COPY . .

# Build the React app for production
RUN npm run build

# Install a simple HTTP server to serve the built app
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Serve the production build
CMD ["serve", "-s", "build", "-l", "3000"]