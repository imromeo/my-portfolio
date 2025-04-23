FROM oven/bun:1 AS base
WORKDIR /app
COPY package*.json ./
RUN bun install
COPY . .
RUN bun --bun run build
# RUN npm prune --production

FROM oven/bun:1
WORKDIR /app
COPY --from=builder /app/build build/
# COPY --from=builder /app/node_modules node_modules/
COPY package.json .
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "bun", "./build/index.js" ]