# ── Build stage ──
FROM node:24-slim AS builder
WORKDIR /app

# Install build tools needed for native modules (sqlite3) on ARM
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm ci

COPY tsconfig.json ./
COPY src ./src
RUN npm run build

# Re-install production-only deps to slim down node_modules
RUN npm ci --omit=dev

# ── Runtime stage ──
FROM node:24-slim
WORKDIR /app

# Copy built output and production dependencies
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY public ./public

ENV NODE_ENV=production

EXPOSE 51546

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD node -e "fetch('http://localhost:51546/startup').then(r=>{if(!r.ok)throw r;process.exit(0)}).catch(()=>process.exit(1))"

CMD ["node", "dist/index.js"]
