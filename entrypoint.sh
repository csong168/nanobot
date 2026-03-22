#!/bin/bash

# 1. Create the config directory
mkdir -p /root/.nanobot

# 2. Generate the configuration file with the correct model
cat > /root/.nanobot/config.json << EOF
{
  "providers": {
    "gemini": {
      "apiKey": "${GEMINI_API_KEY}"
    }
  },
  "agents": {
    "defaults": {
      "model": "gemini/gemini-2.5-flash"
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

# 3. Start a "dummy" web server in the background to satisfy Render's port check
# This uses Python (pre-installed on Render) to listen on the assigned PORT.
python3 -m http.server ${PORT:-10000} &

# 4. Start the actual bot gateway
nanobot gateway