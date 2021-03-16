# myCity

<p align="center">
  <img src="django_project/static/img/myCityLogo.png" alt="logo">
</p>

## Based on this [post](https://blog.alfred.software/2020/02/12/how-to-create-your-own-heroku-clone-and-setup-django-and-postgres/) and this [repo](https://gitlab.com/kamneros/caprover-django), [myCity](https://my-city.club) is an educational app to keep users informed of legal rights & local laws as well as available support resources nearby.

- **Your legal rights & local laws**:
  - (providing you with lawfirms in your town, and resources to learn about in case you feel you become unlawfully detained)

- **Available support resources**:
  - govt agencies,
  - non-profits,
  - local businesses
  - and other places that help with things such as:
    - medical info,
    - recovery resources,
    - access to food,
    - housing,
    - etc

- Later we plan to allow for **Instantly submitting and track benefits** applications via mobile app and mobile/user-friendly website. (It’s the get calfresh for all benefits.)

## Built With

- **[`psycopg2-binary`](https://pypi.org/project/psycopg2-binary/)**: Stand-alone version of `psycopg2`, the most popular PostgreSQL database adapter for the Python programming language.
- **[`whitenoise`](http://whitenoise.evans.io/en/stable/)**: With a couple of lines of config WhiteNoise allows your web app to serve its own static files, making it a self-contained unit that can be deployed anywhere without relying on nginx, Amazon S3 or any other external service. Especially useful on Heroku, OpenShift and other PaaS providers.
- **[`django-admin-env-notice`](https://github.com/dizballanze/django-admin-env-notice)**: Visually distinguish environments in Django Admin.

## Looking Into

- **[`django-admin-honeypot`](https://django-admin-honeypot.readthedocs.io/en/latest/)**: django-admin-honeypot is a fake Django admin login screen to log and notify admins of attempted unauthorized access.
- **[`django-allauth`](https://django-allauth.readthedocs.io/en/latest/installation.html)**: Django Allauth offers a fully integrated authentication app that allows for both local and social authentication.
- **[`djangorestframework`](https://www.django-rest-framework.org/)**: Django REST framework is a powerful and flexible toolkit for building Web APIs.
- **[`django-google-maps`](https://pypi.org/project/django-google-maps/)**: is a simple application that provides the basic hooks into google maps V3 api for use in Django

- [`django-environ`](https://github.com/joke2k/django-environ)
- [`django-dotenv`](https://github.com/jpadilla/django-dotenv)
- [Caprover | Set Up some Environmental Variables](https://www.youtube.com/watch?v=pIF5B-D8jD4&t=1337s)

- [`tutorial-repo`](https://gitlab.com/kamneros/caprover-django)
- [`tutorial-blog`](https://blog.alfred.software/2020/02/12/how-to-create-your-own-heroku-clone-and-setup-django-and-postgres/)
- [`Final Project (Dockerizing Django)`](https://docs.google.com/document/d/1v2SHghK2yvD-XCEolZETN6q4UPtL1Sai_jRH1ROh21Q/edit#)
- [`Spring Intensive 2.3 Proposal`](https://docs.google.com/document/d/1y7tC2fXuBbh0znymnoryIb7qaR-2ImK9_4I9IKvUKdA/edit?usp=sharing)

## 💻 Local Development

## Getting Started

- First, [fork this repo](https://github.com/ChrisBarnes2000/myCity/fork),
- Second, Creat a `.env` file by copying the `.env.sample` and filling in the values,
- Third, run these commands to clone it locally and get started

```zsh
# Clone and CD into/Open this project
$ git clone git@github.com:YOUR_GITHUB_USERNAME/myCity.git && cd myCity
# Download & Install the dependancies. Then Compile the program
$ 
# Run the program locally
$ 
```

### Contribute Instructions

1. Create/Switch to branch and work on it there..

    ```sh
    > gco FrontEnd
    ```

2. Edit Stuff and Test locally

3. Merge with master and fix any conflicts

    ```sh
    > gm FrontEnd/Development/Fixes
    ```

4. add, commit, & Push to that branch

    Use tags when committing ```ga .;gcmsg "[function] description"```

    - [pull]    Who made last change and your addition
    - [update]  description or file being modified
    - [add]     description or file being modified
    - [remove]  description or file being modified
    - [fix]     description or file being modified

    ```sh
    > git push origin FrontEnd/Development/Fixes
    ```

5. Switch to master

    ```sh
    > gcm
    ```

6. Merge with master

    ```sh
    > gm FrontEnd/Development/Fixes
    ```

7. Push

    ```sh
    > gp
    ```

Repeat branching and update your team and progress tracker