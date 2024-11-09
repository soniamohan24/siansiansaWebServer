# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a virtual environment
RUN python3 -m venv /app/venv

# Install dependencies inside the virtual environment
RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt

# Install gunicorn in the virtual environment
RUN /app/venv/bin/pip install gunicorn

# Expose the port the app will run on
EXPOSE 8080

# Define the environment variable for unbuffered output (useful for Docker logs)
ENV PYTHONUNBUFFERED 1

# Run the app using gunicorn from the virtual environment
CMD ["/app/venv/bin/gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
