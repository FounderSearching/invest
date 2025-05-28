#!/bin/bash

# Kill any process running on port 4000
echo "Checking for processes on port 4000..."
PID=$(lsof -ti:4000)

if [ ! -z "$PID" ]; then
    echo "Found process $PID on port 4000. Killing it..."
    kill -9 $PID
    sleep 1  # Give it a moment to release the port
fi

# Start the server
echo "Starting server on port 4000..."
python3 -m http.server 4000

echo ""
echo "Server is running at http://localhost:4000"
echo "Press Ctrl+C to stop the server"
