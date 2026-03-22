#!/bin/bash
mkdir -p /root/.nanobot
cat > /root/.nanobot/config.json << EOF
{
  "providers": {
    "gemini": {
      "apiKey": "${GEMINI_API_KEY}"
    }
  },
  "agents": {
    "defaults": {
      "model": "gemini/gemini-2.0-flash"
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