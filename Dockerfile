FROM node:18 AS builder
WORKDIR /app

COPY server ./server
RUN cd server && npm install


COPY client ./client
RUN cd client && npm install && npm run build

# Final image
FROM node:18
WORKDIR /app
COPY server ./server
COPY --from=builder /app/client/dist ./client/dist
RUN cd server && npm install --omit=dev

EXPOSE 5000
CMD ["node", "server/index.js"]
