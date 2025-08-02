#!/usr/bin/env bash
set -e
# Build and start Docker Compose stack
export COMPOSE_PROJECT_NAME=shopbridge
docker-compose down -v || true
docker-compose build
# Wait for DB to become available
until docker-compose exec -T db pg_isready -U shop_user
  do
    echo "Waiting for PostgreSQL to be available..."
    sleep 2
  done
# Install Python dependencies
docker-compose run --rm api pip install -r requirements.txt
# Schema and seed handled via schema.sql
echo "API and DB are up. Access docs at http://localhost:8000/docs"
