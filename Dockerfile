# Use the official Python image.
FROM python:3.11-slim

# Copy the application code.
COPY main.py /app/main.py

# Set the working directory.
WORKDIR /app

# Run the application by default.
CMD ["python", "main.py"]