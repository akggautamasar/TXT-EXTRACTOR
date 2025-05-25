# Python Based Docker
FROM python:latest

# Installing System Packages
RUN apt update && apt upgrade -y && \
    apt install -y git curl ffmpeg aria2

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements and install Python packages
COPY requirements.txt /requirements.txt
RUN pip install --upgrade -r /requirements.txt

# Create and set working directory
RUN mkdir /EXTRACTOR
WORKDIR /EXTRACTOR

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the script
CMD ["/bin/bash", "/start.sh"]
