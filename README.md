# demo-django
A simple, more or less production ready, django skelleton for deployment with caprover.

__Disclaimer:__ This is based on our experience with CapRover and Django, it is provided as is - without any warranty!

If you find any bugs or have suggestions to better the demo app please feel free to open a issue.

# Setup
During the setup we will refer to the django app as `demo-django` and the prostgre app as `demo-db`.
You may change this names to your liking

## Assumptions

The following assumptions are made about your environment:
- You have a working CapRover
- You have read and understood the basic CapRover documentation
- You have ssh access to you CapRover server

# CapRover
- Create a postgre app from the one-click wizard
- Choose `demo` for the name as this will automatically be prefixed with `-db`
- Note username, database and password

- Create a new blank app with the name `demo-django`
- Fill the environment variables below and enter them with the bulk edit mode
    ```
    CAPROVER=True
    CR_SECRET_KEY=YOUR_KEY
    CR_HOSTS=demo-django.YOUR_CAPROVER_DOMAIN,CUSTOM_DOMAIN
    CR_DB_NAME=XXX
    CR_DB_USER=XXX
    CR_DB_PASSWORD=XXX
    CR_DB_HOST=srv-captain--demo-db
    CR_DB_PORT=5432
    ```

# Django
- Deploy the code from this repository with your method of choice to `demo-django`
- Open a ssh sessiomn to `demo-django` and create a superuser by executing `python manage.py createsuperuser`

# Support
If you want professional support with this or other Django related issues, like integrating GitLab CICD with CapRover and DigitalOcean feel free to contact us.

support@kamner.de
