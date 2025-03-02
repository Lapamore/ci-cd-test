# Используем официальный Python образ
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Копируем весь проект в контейнер
COPY . /app

# Открываем порт приложения
EXPOSE 5000

# Команда для запуска приложения
CMD ["python", "main.py"]
