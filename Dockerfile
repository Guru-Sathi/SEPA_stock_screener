FROM python:3.11-slim

# Prevent Python from buffering stdout/stderr (crucial for Cloud Run logging)
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml .
RUN pip install --no-cache-dir .

COPY config/ ./config/
COPY core/ ./core/
COPY notifications/ ./notifications/
COPY storage/ ./storage/
COPY main.py .

CMD ["python", "main.py"]