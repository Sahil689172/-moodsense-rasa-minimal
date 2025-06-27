FROM python:3.8-slim

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 10000

CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug", "--port", "10000"]
