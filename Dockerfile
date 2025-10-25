FROM node:20-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/youtube-transcript-plus/youtube-transcript-api.git . && \
    npm install && \
    npm install -D wrangler@latest && \
    sed -i '/node_compat = true/d' wrangler.toml && \
    sed -i '/\[observability\]/i compatibility_flags = ["nodejs_compat"]\n' wrangler.toml

EXPOSE 8084

ENV PORT=8084
ENV HOST=0.0.0.0

CMD ["npx", "wrangler", "dev", "--port", "8084", "--ip", "0.0.0.0"]
