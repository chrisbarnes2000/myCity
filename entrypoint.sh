#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# python manage.py flush --no-input
python manage.py migrate
python manage.py collectstatic --no-input
#  --clear

# For Production:
gunicorn project.wsgi --reload --workers=2 --threads=4 --worker-tmp-dir=/dev/shm --bind=0.0.0.0:8000 --log-file=- --worker-class=gthread


exec "$@"
