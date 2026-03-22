#!/bin/bash
mkdir -p /root/.nanobot
cat > /root/.nanobot/config.json << EOF
{
  "providers": {
    "deepseek": {
      "apiKey": "${DEEPSEEK_API_KEY}"
    }
  },
  "agents": {
    "defaults": {
      "model": "deepseek/deepseek-chat"
    }
  },
  "channels": {
    "telegram": {
      "enabled": true,
      "token": "${TELEGRAM_BOT_TOKEN}",
      "allowFrom": ["${TELEGRAM_USER_ID}"]
    }
  }
}
EOF
nanobot gateway