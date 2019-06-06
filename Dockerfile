FROM python:3.7-alpine

# install system-wide deps for python and postgres
RUN apk update \
  && apk add \
    build-base \
    postgresql \
    postgresql-dev \
    libpq

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set work directory
RUN mkdir /code
WORKDIR /code

# install dependencies
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy files
COPY . /code/
