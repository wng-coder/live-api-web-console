# Use official Node.js 22 image
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Install dev dependencies for type definitions and testing
RUN npm install --save-dev @types/react-dom @types/lodash @types/react-syntax-highlighter @types/jest @testing-library/react

# Copy the rest of the app
COPY . .

# Set environment variables (override in runtime as needed)
ENV NODE_ENV=production
ENV PORT=13000

# Expose custom React port
EXPOSE 13000

# Start the app
CMD ["npm", "start"]
