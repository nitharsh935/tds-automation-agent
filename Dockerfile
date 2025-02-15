FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev libsqlite3-dev && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python -m pip install --upgrade pip

# Install required Python packages
RUN pip install --no-cache-dir fastapi uvicorn openai requests duckdb

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Run the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
