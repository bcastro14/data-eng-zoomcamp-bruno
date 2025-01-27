FROM python:3.12.8

RUN apt-get update && apt-get install -y wget
RUN pip install pandas sqlalchemy psycopg2

WORKDIR /app
COPY data-ingestion.py data-ingestion.py

ENTRYPOINT ["python", "data-ingestion.py"]