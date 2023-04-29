FROM python:3.8

WORKDIR /app

COPY requirements.txt requirements.txt 

RUN pip install -r requirements.txt

COPY . .

RUN python3 server/manage.py makemigrations

RUN python3 server/manage.py migrate

CMD ["python3", "server/manage.py", "runserver", "0.0.0.0:8000"]