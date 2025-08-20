#old ubuntu
FROM ubuntu:18.04

RUN apt update
RUN apt install -y nginx php-fpm

# RUN pip install --no-cahce-dir --upgrade pip && \
#     pip install --no-cahce-dir requests=2.26.0 && \
#     pip install --no-cahce-dir django==1.2

COPY requirements.txt /requirements.txt
COPY hello_app.py /hello_app.py
CMD ["python3 hello_app.py"]

EXPOSE 80 443
