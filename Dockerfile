# Use the official Python base image
FROM python:3.8

# Install system dependencies required by psycopg2
RUN apt-get update \
    && apt-get install -y libpq-dev gcc

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file and install dependencies
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy the Django project into the container
COPY . /code/

# Expose the Django development server port (change this if necessary)
EXPOSE 8000

# Run the Django development server
CMD python puppy_store/manage.py runserver 0.0.0.0:8000