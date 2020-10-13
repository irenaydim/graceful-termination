#!/usr/bin/env bash
pid1=0
pid2=0

# SIGTERM handler
term_handler() {
  # Stop process p1 with SIGTERM
  if [ $pid1 -ne 0 ]; then
    kill -SIGTERM $pid1
    wait $pid1
  fi

  # Stop process p2 with SIGTERM
  if [ $pid2 -ne 0 ]; then
    kill -SIGTERM $pid2
    wait $pid2
  fi
}

# Catch SIGTERM signal and execute term_handler
trap term_handler SIGTERM

# Start process p1 in the background
node ./p1.js &
# Get p1 PID
pid1=$!

# Start process p2 in the background
node ./p2.js &
# Get p2 PID
pid2=$!

# Wait for all current child processes to complete
wait
echo "All processess terminated successfully"
