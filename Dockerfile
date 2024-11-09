# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies, including gunicorn
RUN pip install --no-cache-dir -r requirements.txt

# If gunicorn is not in requirements.txt, you can install it explicitly:
RUN pip install gunicorn

# Copy the application files
COPY . .

# Expose the application port
EXPOSE 5000

# Command to run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
