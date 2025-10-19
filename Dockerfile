FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV LANG=en_US.UTF-8
ENV PATH="/app/.venv/bin:$PATH"

# Install system dependencies and uv
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        bash \
        git \
        curl \
        ca-certificates \
        locales && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir uv

WORKDIR /app
COPY . .

# Create virtual environment and install dependencies
RUN uv venv /app/.venv && \
    uv pip compile pyproject.toml -o requirements.txt && \
    pip install --no-cache-dir -r requirements.txt

RUN chmod +x start.sh
CMD ["bash", "start.sh"]
