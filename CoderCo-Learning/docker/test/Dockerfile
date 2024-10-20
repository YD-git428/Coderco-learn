FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt .  
RUN pip install -r requirements.txt  

COPY . .  

EXPOSE 7777

CMD ["python", "app.py"]