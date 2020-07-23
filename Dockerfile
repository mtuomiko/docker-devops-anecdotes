FROM ubuntu:16.04

WORKDIR /app

RUN apt-get update && apt-get install --no-install-recommends -y \ 
    curl git ca-certificates && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    git clone https://github.com/mtuomiko/docker-devops-anecdotes.git . && \
    npm install && \
    npm run build && \
    npm install -g serve && \
    apt-get purge -y --auto-remove curl git && \
    rm -rf /var/lib/apt/lists/*

CMD serve -s -l $PORT build

