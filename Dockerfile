# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /task-agent-api

# Copy requirements file
COPY requirements.txt .

# Show Python version and pip version (debugging step)
RUN python --version && pip --version

# Install dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Expose the FastAPI server port
EXPOSE 8000

# Run the FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]