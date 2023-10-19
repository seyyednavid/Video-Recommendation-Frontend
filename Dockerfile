FROM node:18-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html



# FROM node:18-alpine
# ARG REACT_APP_API_BASE_URL
# WORKDIR /app
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build
# RUN npm install -g serve
# CMD ["serve", "-s", "build"]