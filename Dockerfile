FROM python:3.10-slim

# Install necessary build tools and libraries
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    curl \
    cmake \
    gdal-bin \
    libgdal-dev \
    build-essential \
    python3-gdal \
    && apt-get clean

# Set GDAL environment variables
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# Install pip and required Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY main.py .

# Set the entry point for the container
CMD ["python", "main.py"]
