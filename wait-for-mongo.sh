#!/bin/bash

RETRIES=30

until docker exec mongo1 mongo --host mongo1:27017 --eval "db.adminCommand('ping')" > /dev/null 2>&1
do
  echo "⏳ Waiting for mongo1 to be ready..."
  sleep 2
  RETRIES=$((RETRIES-1))
  if [ $RETRIES -le 0 ]; then
    echo "❌ MongoDB is not ready after waiting. Exiting..."
    exit 1
  fi
done

echo "✅ MongoDB is ready!"

