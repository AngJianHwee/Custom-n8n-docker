FROM n8nio/n8n:latest

USER root

# Check what's available in the base image
RUN which python3 python pip3 apk apt-get yum dnf 2>/dev/null || echo "Checking available commands..." && ls /usr/bin/ | head -30

# Create and configure virtual environment (if python3 exists)
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install your required Python libraries
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir requests pandas numpy

USER node
