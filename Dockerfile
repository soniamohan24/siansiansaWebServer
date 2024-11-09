FROM python:3.9-slim

# Install gunicorn and other dependencies
RUN pip install gunicorn

# Set the working directory
WORKDIR /app

# Copy the app files into the container
COPY . /app

# Set the entrypoint to gunicorn
ENTRYPOINT ["gunicorn"]
CMD ["--bind", "0.0.0.0:8080", "app:app"]
