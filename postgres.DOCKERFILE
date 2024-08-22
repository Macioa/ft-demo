# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables for the PostgreSQL database
ENV POSTGRES_DB=ftdemo
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Install PostGIS and its dependencies
RUN apt-get update && \
    apt-get install -y postgis postgresql-13-postgis-3 && \
    rm -rf /var/lib/apt/lists/*

# Expose the default PostgreSQL port
EXPOSE 5432

# The official PostgreSQL image already includes an entrypoint script
# that initializes the database and runs the PostgreSQL server