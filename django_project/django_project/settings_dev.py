"""local runserver settings"""

import os

from django.core.exceptions import ImproperlyConfigured

from .settings import BASE_DIR

print("\n\n------NEW DEV RUN------")

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get("SECRET_KEY")

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
ENVIRONMENT_NAME = "Dev Server"
ENVIRONMENT_COLOR = "#028A0F"
ENVIRONMENT_FLOAT = True
# ENVIRONMENT_ADMIN_SELECTOR="grp-header"

ALLOWED_HOSTS = []

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": os.path.join(BASE_DIR, "db.sqlite3"),
    }
}

# Static Files
STATIC_ROOT = os.path.join(BASE_DIR, "static")
STATIC_URL = "/static/"
