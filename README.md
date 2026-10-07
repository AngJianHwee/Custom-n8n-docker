# Custom n8n Docker Image

A custom Docker image based on the official [n8n](https://n8n.io/) image with Python 3 and common data science libraries pre-installed.

## Features

- **Base**: `n8nio/n8n:latest`
- **Python 3** with pip
- **Python libraries**: `requests`, `pandas`, `numpy`
- **Build tools**: `make`, `g++`, `gcc`, `python3-dev` (for compiling native extensions)

## Quick Start

### Build the image

```bash
docker build -t custom-n8n .
```

### Run the container

```bash
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  custom-n8n
```

Then open http://localhost:5678 in your browser.

## Usage with docker-compose

```yaml
version: '3.8'

services:
  n8n:
    build: .
    container_name: n8n
    ports:
      - "5678:5678"
    volumes:
      - n8n_data:/home/node/.n8n
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=your_password

volumes:
  n8n_data:
```

Run with:
```bash
docker-compose up -d
```

## Why this image?

The official n8n image is Node.js-based and doesn't include Python. This image adds Python so you can:

- Use **Python scripts** in n8n's Function/Function Item nodes via the `python3` command
- Run **data processing** workflows with pandas/numpy
- Make **HTTP requests** from Python using requests
- Install additional Python packages at runtime via pip

## Adding more Python packages

### At build time (recommended)

Edit the `dockerfile` and add packages to the pip install line:

```dockerfile
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir requests pandas numpy your-package-here
```

### At runtime

```bash
docker exec -it n8n pip install package-name
```

## License

MIT