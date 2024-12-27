FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt /app/

# Install pipenv and create a virtual environment
RUN pip install pipenv
RUN pipenv install --deploy --ignore-pipfile

# Activate the virtual environment and copy the application files
COPY . /app/

# Run migrations inside the virtual environment
CMD ["pipenv", "run", "python", "manage.py", "migrate"]


