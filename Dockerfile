FROM node:18-slim AS builder
WORKDIR /app

COPY backend ./backend
RUN cd backend && npm install


COPY frontend ./frontend
RUN cd frontend && npm install && npm run build

# Final image
FROM node:18
WORKDIR /app
COPY backend ./backend
COPY --from=builder /app/frontend/dist ./frontend/dist
RUN cd backend && npm install --omit=dev

EXPOSE 5000
CMD ["node", "server/index.js"]
