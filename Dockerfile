# FROM python:3.8

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Set the working directory in the container
# WORKDIR /project

# # Copy the current directory contents into the container at /project
# COPY . /project

# # Install dependencies including Django
# RUN pip install -r requirements.txt

# # Specify the command to run on container start
# # CMD [["python", "./backend/manage.py", "migrate"], ["python", "manage.py", "runserver", "127.0.0.1:8000"]]

# CMD python ./backend/manage.py migrate && python manage.py runserver 127.0.0.1:8000




# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire Django project directory into the container at /app
COPY . /app/

# Navigate to the backend directory
WORKDIR /app/backend

# Run migrations and other Django management commands
# Adjust the command as per your requirement
# Command to run the Django development server
CMD python manage.py migrate && python manage.py runserver 127.0.0.1:8000