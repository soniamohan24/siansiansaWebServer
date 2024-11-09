# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container to /home/ubuntu (matching your setup)
WORKDIR /home/ubuntu/sianWebServer

# Copy the current directory contents into the container at /home/ubuntu/sianWebServer
COPY . /home/ubuntu/sianWebServer

# Install pip (if it's missing) and necessary dependencies
RUN apt-get update && apt-get install -y python3-venv python3-pip

# Create a virtual environment using python3
RUN python3 -m venv /home/ubuntu/sianWebServer/venv

# Check if virtual environment was created successfully
RUN if [ ! -d "/home/ubuntu/sianWebServer/venv" ]; then echo "Virtual environment creation failed"; exit 1; fi

# List contents of /home/ubuntu/sianWebServer/venv/bin to check if pip exists
RUN ls -l /home/ubuntu/sianWebServer/venv/bin

# Install pip in the virtual environment if it's missing
RUN /usr/bin/python3 -m ensurepip --upgrade

# Upgrade pip to the latest version
RUN /home/ubuntu/sianWebServer/venv/bin/pip install --upgrade pip

# Install dependencies inside the virtual environment
RUN /home/ubuntu/sianWebServer/venv/bin/pip install --no-cache-dir -r requirements.txt

# Install gunicorn in the virtual environment
RUN /home/ubuntu/sianWebServer/venv/bin/pip install gunicorn

# Expose the port the app will run on
EXPOSE 8080

# Define the environment variable for unbuffered output (useful for Docker logs)
ENV PYTHONUNBUFFERED 1

# Set the PATH to include the virtual environment's bin directory
ENV PATH="/home/ubuntu/sianWebServer/venv/bin:$PATH"

# Ensure gunicorn is installed correctly
RUN /home/ubuntu/sianWebServer/venv/bin/pip show gunicorn

# Run the app using gunicorn from the virtual environment
CMD ["/home/ubuntu/sianWebServer/venv/bin/gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
