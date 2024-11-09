# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file (make sure Gunicorn is in it)
COPY requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# If Gunicorn is not in the requirements.txt, you can install it manually:
# RUN pip install gunicorn

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 8080

# Command to run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
