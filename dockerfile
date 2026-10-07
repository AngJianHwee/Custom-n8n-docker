FROM n8nio/n8n:latest

USER root

# Install Python and create virtual environment
RUN apk add --no-cache python3 py3-pip python3-venv && \
    python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install your required Python libraries
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir requests pandas numpy

USER node
