# ============================================
# STAGE 1: Install dependencies
# ============================================
FROM python:3.12-slim AS builder

WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies to a temporary location
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ============================================
# STAGE 2: Production runtime
# ============================================
FROM python:3.12-slim

WORKDIR /app

# Copy installed dependencies from stage 1
COPY --from=builder /install /usr/local

# Copy application code
COPY app.py .

# Expose port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]