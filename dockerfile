FROM n8nio/n8n:latest

USER root

# Install Python and create a virtual environment
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install your required Python libraries
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir requests pandas numpy

USER node
