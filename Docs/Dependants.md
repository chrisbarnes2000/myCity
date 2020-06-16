# Dependants

Originally based on this [post](https://testdriven.io/dockerizing-django-with-postgres-gunicorn-and-nginx).
and this Production ready Docker + Django + Bootstrap 4 starter pack. [project repo](https://github.com/ChrisBarnes7404/django-on-docker)

## 📂 Project Files

| Filename | Description |
| -------- | ----------- |
| `.gitignore` | General ignore file. Optimized for Python. |
| `.dockerignore` | A list of files that will not be copied during build. |
| `captain-definition` | **DO NOT MODIFY.** Used by CapRover for deployment. |
| `Dockerfile` | **Implement solutions in this file**. |
| `README.md` | Replace this `README` with content describing the purpose of your project. |


Includes the following built in support for:
- **[`django-admin-env-notice`](https://github.com/dizballanze/django-admin-env-notice)**: Visually distinguish environments in Django Admin.
- **[`django-admin-honeypot`](https://django-admin-honeypot.readthedocs.io/en/latest/)**: django-admin-honeypot is a fake Django admin login screen to log and notify admins of attempted unauthorized access.
- **[`django-allauth`](https://django-allauth.readthedocs.io/en/latest/installation.html)**: Django Allauth offers a fully integrated authentication app that allows for both local and social authentication.
- **[`djangorestframework`](https://www.django-rest-framework.org/)**: Django REST framework is a powerful and flexible toolkit for building Web APIs.
- **[`django-google-maps`](https://pypi.org/project/django-google-maps/)**: is a simple application that provides the basic hooks into google maps V3 api for use in Django

<!-- - **[``]()**:  -->
<!-- - **[``]()**:  -->
<!-- - **[``]()**:  -->

<!-- 
- **[`django-compressor`](https://github.com/django-compressor/django-compressor)**: Django Compressor processes, combines and minifies linked and inline Javascript or CSS in a Django template into cacheable static files. Supports such as CoffeeScript, LESS, and SASS.
- **[`django-debug-toolbar`](https://github.com/jazzband/django-debug-toolbar)**: The Django Debug Toolbar is a configurable set of panels that display various debug information about the current request/response and when clicked, display more details about the panel's content.
- **[`django-dotenv`](https://github.com/jpadilla/django-dotenv)**: Allows `manage.py` to read environment settings stored in a `.env` file.


- **[`pillow`](https://pillow.readthedocs.io/en/stable/)**: Pillow is a friendly PIL fork. PIL is the Python Imaging Library by Fredrik Lundh and Contributors.
-->
- **[`psycopg2-binary`](https://pypi.org/project/psycopg2-binary/)**: Stand-alone version of `psycopg2`, the most popular PostgreSQL database adapter for the Python programming language.
- **[`whitenoise`](http://whitenoise.evans.io/en/stable/)**: With a couple of lines of config WhiteNoise allows your web app to serve its own static files, making it a self-contained unit that can be deployed anywhere without relying on nginx, Amazon S3 or any other external service. Especially useful on Heroku, OpenShift and other PaaS providers.