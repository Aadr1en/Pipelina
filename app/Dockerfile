# build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install --production
COPY . .


# final stage
FROM node:18-alpine AS runtime
WORKDIR /app
RUN apk update && apk upgrade --no-cache
COPY --from=build /app .
ENV PORT=3000
EXPOSE 3000
CMD ["node", "index.js"]