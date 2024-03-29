from flask import Flask, render_template, request, redirect, url_for, flash, abort
from flask_login import LoginManager, UserMixin, login_required, current_user, login_user, logout_user
from flask_mail import Mail, Message
from flask_hashing import Hashing
from dotenv import load_dotenv
from os import environ, path
import sqlite3

basedir = path.abspath(path.dirname(__file__))
load_dotenv(path.join(basedir, '.env'))

# /--------------------------------------------\ #
# |----------------Setup/Init------------------| #
# \--------------------------------------------/ #


# Setup Flask and login
app = Flask(__name__)
app.config.update(
    SECRET_KEY=environ.get('SECRET_KEY'),
    FLASK_ENV=environ.get('FLASK_ENV'),
    DEBUG=environ.get('DEBUG'),

    MAIL_SERVER=environ.get('EMAIL_SERVER'),
    MAIL_PORT=environ.get('EMAIL_PORT'),
    MAIL_DEFAULT_SENDER=environ.get('EMAIL_DEFAULT_SENDER'),
    MAIL_USERNAME=environ.get('EMAIL_USERNAME'),
    MAIL_PASSWORD=environ.get('EMAIL_PASSWORD'),
    MAIL_USE_TLS=environ.get('EMAIL_USE_TLS'),
    MAIL_USE_SSL=environ.get('EMAIL_USE_SSL'),
)

login_manager = LoginManager(app)
hashing = Hashing(app)
mail = Mail(app)


def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn


def get_post(post_id):
    conn = get_db_connection()
    post = conn.execute('SELECT * FROM posts WHERE id = ?',
                        (post_id,)).fetchone()
    conn.close()
    if post is None:
        abort(404)
    return post


def get_user(email):
    conn = get_db_connection()
    user = conn.execute('SELECT * FROM users WHERE email = ?',
                        (email,)).fetchone()
    conn.close()
    return user

# /--------------------------------------------\ #
# |------------------Handlers------------------| #
# \--------------------------------------------/ #


@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('errors/404.html'), 404


@app.errorhandler(500)
def internal_server_issue_page(e):
    # note that we set the 500 status explicitly
    return render_template('errors/500.html'), 500


@login_manager.unauthorized_handler
def unauthorized_handler():
    # return render_template('auth/unauthorized')
    return 'Unauthorized'


# /--------------------------------------------\ #
# |-------------------Mixines------------------| #
# \--------------------------------------------/ #

class User(UserMixin):
    def __init__(self, email, first_name=None, last_name=None):
        self.id = email
        self.first_name = first_name
        self.last_name = last_name

    def get(user_id):
        return self


@login_manager.user_loader
def user_loader(email):
    if get_user(email) is None:
        return
    return User(email)


@login_manager.request_loader
def request_loader(request):
    email = request.form.get('email')
    password = request.form.get('password')

    if get_user(email) is None:
        return

    user = User(email)

    # DO NOT ever store passwords in plaintext and always compare password
    # hashes using constant-time comparison!
    h = hashing.hash_value(password, salt='abcd')
    user.is_authenticated = hashing.check_value(h, password, salt='abcd')

    return user


# /--------------------------------------------\ #
# |---------------------Mail-------------------| #
# \--------------------------------------------/ #


# @app.route("/send")
def send_mail(subject, html, recipients):
    msg = Message(subject, recipients, html)
    mail.send(msg)
    return 'Mail Sent'


# /--------------------------------------------\ #
# |--------------------Routes------------------| #
# \--------------------------------------------/ #

@app.route('/register', methods=('GET', 'POST'))
def register():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        first_name = request.form['first_name']
        last_name = request.form['last_name']

        if not email or not password:
            flash('Eail & Password are required!')
        else:
            conn = get_db_connection()
            user = conn.execute('INSERT INTO users (email, password, first_name, last_name) VALUES (?, ?, ?, ?)',
                                (email, hashing.hash_value(password, salt='abcd'), first_name, last_name))
            conn.commit()
            conn.close()

            send_mail(
                subject="New User | " + email,
                html="<p> Welcome The New User </p>",
                recipients=["Chris.Barnes.2000@me.com"]
            )

            login_user(User(email))
            return redirect(url_for('index'))

    # return render_template('auth/register')
    return '''
               <form action='register' method='POST'>
                <input type='email' name='email' id='email' placeholder='email'/>
                <input type='password' name='password' id='password' placeholder='password'/>
                <input type='text' name='first_name' id='first_name' placeholder='first_name'/>
                <input type='text' name='last_name' id='last_name' placeholder='last_name'/>
                <input type='submit' name='submit'/>
               </form>
               '''


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        # return render_template('auth/login')
        return '''
               <form action='login' method='POST'>
                <input type='email' name='email' id='email' placeholder='email'/>
                <input type='password' name='password' id='password' placeholder='password'/>
                <input type='submit' name='submit'/>
               </form>
               '''

    email = request.form['email']
    password = request.form['password']
    h = hashing.hash_value(password, salt='abcd')

    user = get_user(email)
    if user is not None and hashing.check_value(h, user['password'], salt='abcd'):
        login_user(User(email))
        return redirect(url_for('settings'))

    return 'Bad login'


@app.route("/logout")
def logout():
    logout_user()
    return redirect('index')


# @app.route('/login', methods=['GET', 'POST'])
# def login():
#     # Here we use a class of some kind to represent and validate our
#     # client-side form data. For example, WTForms is a library that will
#     # handle this for us, and we use a custom LoginForm to validate.
#     form = LoginForm()
#     if form.validate_on_submit():
#         # Login and validate the user.
#         # user should be an instance of your `User` class
#         login_user(user)

#         flash('Logged in successfully.')

#         next = request.args.get('next')
#         # is_safe_url should check if the url is safe for redirects.
#         # See http://flask.pocoo.org/snippets/62/ for an example.
#         if not is_safe_url(next):
#             return abort(400)

#         return redirect(next or url_for('index'))
#     return render_template('login.html', form=form)


@app.route('/')
@app.route('/index')
def index():
    """Show the Index page."""
    return render_template('index.html')


@app.route('/benefits')
def benefits():
    """Show the benefits page."""
    return render_template('benefits.html')


@app.route('/creators')
def creators():
    """Show the creators page."""
    return render_template('creators.html')


@app.route('/food')
def food():
    """Show the food-info page."""
    return render_template('food_locations.html')


@app.route('/health')
def health():
    """Show the health-info page."""
    return render_template('health_resources.html')


@app.route('/legal')
def legal():
    """Show the legal-help page."""
    return render_template('legal_help.html')


@app.route('/resources')
def resources():
    """Show the resources page."""
    return render_template('resources.html')


@app.route('/shelters')
def shelters():
    """Show the shelter-info page."""
    return render_template('shelter_info.html')


# /--------------------------------------------\ #
# |--------------Protected Routes--------------| #
# \--------------------------------------------/ #


@app.route("/settings")
@login_required
def settings():
    # return render_template('auth/settings.html')
    return 'Logged in as: ' + current_user.id


# /--------------------------------------------\ #
# |-------------Blog/Post Routes---------------| #
# \--------------------------------------------/ #


@app.route('/blog')
@login_required
def blog():
    """Show the Index page."""
    conn = get_db_connection()
    posts = conn.execute('SELECT * FROM posts').fetchall()
    conn.close()
    return render_template('blog/index.html', posts=posts)


@app.route('/blog/<int:id>')
@login_required
def post(id):
    post = get_post(id)
    return render_template('blog/post.html', post=post)


@app.route('/blog/create', methods=('GET', 'POST'))
@login_required
def create():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            post = conn.execute('INSERT INTO posts (title, content) VALUES (?, ?)',
                                (title, content))
            conn.commit()
            conn.close()

            send_mail(
                subject="New Post | " + title,
                html=render_template('blog/post.html', post=post),
                recipients=["Chris.Barnes.2000@me.com"]
            )

            return redirect(url_for('blog'))

    return render_template('blog/create.html')


@app.route('/blog/<int:id>/edit', methods=('GET', 'POST'))
@login_required
def edit(id):
    post = get_post(id)

    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            post = conn.execute('UPDATE posts SET title = ?, content = ?'
                                ' WHERE id = ?',
                                (title, content, id))
            conn.commit()
            conn.close()

            send_mail(
                subject="Post | " + title + " | Edited",
                html=render_template('blog/post.html', post=post),
                recipients=["Chris.Barnes.2000@me.com"]
            )

            return redirect(url_for('blog'))

    return render_template('blog/edit.html', post=post)


@app.route('/blog/<int:id>/delete', methods=('POST',))
@login_required
def delete(id):
    post = get_post(id)
    conn = get_db_connection()
    conn.execute('DELETE FROM posts WHERE id = ?', (id,))
    conn.commit()
    conn.close()
    flash('"{}" was successfully deleted!'.format(post['title']))
    return redirect(url_for('blog'))


# /--------------------------------------------\ #
# |---------------Entrypoint/Run---------------| #
# \--------------------------------------------/ #

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000,
            debug=environ.get('DEBUG'), load_dotenv=True)
