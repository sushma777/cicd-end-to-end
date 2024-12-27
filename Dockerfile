# Use a more feature-rich Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt first to leverage Docker caching
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files into the container
COPY . /app/

# Run migrations
RUN python manage.py migrate

# Expose the port the app will run on
EXPOSE 8000

# Start the Django development server on all interfaces
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
