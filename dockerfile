FROM n8nio/n8n:latest

USER root

# Install Python 3 and dependencies
RUN apk add --no-cache python3 py3-pip make g++ gcc python3-dev

# Create and configure virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install your required Python libraries
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir requests pandas numpy

USER node
