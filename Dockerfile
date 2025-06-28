FROM python:3.8-slim

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Optional: Silence SQLAlchemy warnings and ensure compatibility
ENV SQLALCHEMY_SILENCE_UBER_WARNING=1
RUN pip install "sqlalchemy<2.0"

EXPOSE 5005

CMD ["sh", "-c", "rasa run --enable-api --port ${PORT:-5005} --cors '*'" ]

