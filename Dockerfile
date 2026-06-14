FROM python:3.12-slim

WORKDIR /app

COPY src/ /app/

CMD ["python", "generate.py", "/data"]