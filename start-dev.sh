#!/usr/bin/env bash

# Exit script if any process fails or is terminated
set -e

# Store the root project directory absolute path
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to stop background frontend when script exits or is killed (Ctrl+C)
cleanup() {
  echo -e "\nStopping frontend process..."
  if [ -n "$FRONTEND_PID" ]; then
    kill "$FRONTEND_PID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# 1. Start Frontend in the background
echo "Starting Frontend..."
(
  cd "$PROJECT_ROOT/src/frontend" && npm start
) &
FRONTEND_PID=$!


# 2. Open Firefox to your docs page in the background
echo "Opening documentation in Firefox..."
# open -a "Firefox" "http://localhost:80/docs" 
# open -a "Firefox" "http://localhost:80/get_data_stories" 
open -a Firefox

# 3. Start Service in the foreground (showing logs directly)
echo "Starting Service..."
cd "$PROJECT_ROOT"
source .venv/bin/activate
cd src/service
python main.py
