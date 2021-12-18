FROM python:3.10.0

WORKDIR /home/

RUN git clone https://github.com/EasyCoding-7/MrCoGuRi.git

WORKDIR /home/MrCoGuRi/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=django-insecure-8$et$f%r7(z=fdkeh1st@5i^)d2d7=onzisrbqw-!_%!vm6@xt" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=coguri_main.settings.deploy && gunicorn coguri_main.wsgi --env DJANGO_SETTINGS_MODULE=coguri_main.settings.deploy --bind 0.0.0.0:8000"]