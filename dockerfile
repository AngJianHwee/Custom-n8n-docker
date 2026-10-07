FROM python:3.12-slim-bookworm AS python-builder

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir --upgrade pip && \
    /opt/venv/bin/pip install --no-cache-dir requests pandas numpy

FROM n8nio/n8n:latest

USER root

# The n8n image is distroless, so copy Python and its dependencies from the
# builder instead of using apt-get or apk in the final image.
COPY --from=python-builder /usr/local /usr/local
COPY --from=python-builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

USER node
