FROM python:3.9.0

WORKDIR /home/

RUN echo 'SDLFKMsldkfm'

RUN git clone https://github.com/dhkdl/secondproject.git

WORKDIR /home/secondproject/


RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient


EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=secondproject.settings.deploy && python manage.py migrate --settings=secondproject.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=secondproject.settings.deploy secondproject.wsgi --bind 0.0.0.0:8000"]