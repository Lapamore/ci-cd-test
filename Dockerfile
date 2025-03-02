FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3.11-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/ .

RUN python3.11 -m pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "main.py"]