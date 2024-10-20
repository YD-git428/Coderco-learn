FROM python:3.8-slim as Build

WORKDIR /app

COPY requirements.txt .  

RUN pip install -r requirements.txt  

COPY . .  

FROM python:3.8-slim

WORKDIR /app

COPY --from=Build /app /app

EXPOSE 7777

CMD ["python", "app.py"]