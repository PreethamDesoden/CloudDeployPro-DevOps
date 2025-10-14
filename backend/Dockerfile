# Use Python 3.12 as base image
FROM python:3.12-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements first (for better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 5000
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]