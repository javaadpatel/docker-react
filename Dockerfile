# Configuration for the build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Configuration for the run phase (FROM statements terminate each block)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Default command starts up nginx

#Running the container -> docker run -p 8080:80 08be9b4c0600