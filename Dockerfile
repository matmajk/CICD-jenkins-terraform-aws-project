FROM python:3.10

COPY requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt

COPY . /opt/app

EXPOSE 5000

CMD ["python3", "/opt/app/main.py"]
