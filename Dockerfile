FROM python:3.9-slim

WORKDIR /app

COPY . . 

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "-m", "unittest", "test_app.py"]