# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Устанавливаем необходимые пакеты
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Добавляем репозиторий для Python 3.11
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3.11-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы приложения в контейнер
COPY app/ .

# Создаем виртуальное окружение
RUN python3.11 -m venv venv

# Активируем виртуальное окружение и устанавливаем зависимости
RUN . venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

# Устанавливаем переменную окружения для использования виртуального окружения
ENV PATH="/app/venv/bin:$PATH"

# Экспортируем порт
EXPOSE 5000

# Определяем команду для запуска приложения
CMD ["python3.11", "main.py"]