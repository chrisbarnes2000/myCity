from flask import Flask, render_template, request, redirect, url_for, flash
from flask_login import LoginManager, UserMixin, login_required, current_user, login_user, logout_user
import sqlite3
from werkzeug.exceptions import abort


# /--------------------------------------------\ #
# |----------------Setup/Init------------------| #
# \--------------------------------------------/ #


# Setup Flask and login
app = Flask(__name__)
app.secret_key = 'super secret string'  # Change this!

login_manager = LoginManager()
login_manager.init_app(app)

# Our mock database.
users = {'foo@bar.tld': {'password': 'secret'}}


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

# /--------------------------------------------\ #
# |------------------Handlers------------------| #
# \--------------------------------------------/ #

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('404.html'), 404


@app.errorhandler(404)
def internal_server_issue_page(e):
    # note that we set the 500 status explicitly
    return render_template('500.html'), 500


@login_manager.unauthorized_handler
def unauthorized_handler():
    return 'Unauthorized'



# /--------------------------------------------\ #
# |-------------------Mixines------------------| #
# \--------------------------------------------/ #

class User(UserMixin):
    def get(user_id):
        return 'User'


@login_manager.user_loader
def user_loader(email):
    if email not in users:
        return

    user = User()
    user.id = email
    return user


@login_manager.request_loader
def request_loader(request):
    email = request.form.get('email')
    if email not in users:
        return

    user = User()
    user.id = email

    # DO NOT ever store passwords in plaintext and always compare password
    # hashes using constant-time comparison!
    user.is_authenticated = request.form['password'] == users[email]['password']

    return user



# /--------------------------------------------\ #
# |--------------Protected Routes--------------| #
# \--------------------------------------------/ #

@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(index)


@app.route("/settings")
@login_required
def settings():
    return 'Logged in as: ' + current_user.id



# /--------------------------------------------\ #
# |--------------------Routes------------------| #
# \--------------------------------------------/ #

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return '''
               <form action='login' method='POST'>
                <input type='text' name='email' id='email' placeholder='email'/>
                <input type='password' name='password' id='password' placeholder='password'/>
                <input type='submit' name='submit'/>
               </form>
               '''

    email = request.form['email']
    if request.form['password'] == users[email]['password']:
        user = User()
        user.id = email
        login_user(user)
        return redirect(url_for('protected'))

    return 'Bad login'


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
# |-------------Blog/Post Routes---------------| #
# \--------------------------------------------/ #


@app.route('/blog')
def blog():
    """Show the Index page."""
    conn = get_db_connection()
    posts = conn.execute('SELECT * FROM posts').fetchall()
    conn.close()
    return render_template('blog/index.html', posts=posts)


@app.route('/blog/<int:id>')
def post(id):
    post = get_post(id)
    return render_template('blog/post.html', post=post)


@app.route('/blog/create', methods=('GET', 'POST'))
def create():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            conn.execute('INSERT INTO posts (title, content) VALUES (?, ?)',
                         (title, content))
            conn.commit()
            conn.close()
            return redirect(url_for('blog'))

    return render_template('blog/create.html')


@app.route('/blog/<int:id>/edit', methods=('GET', 'POST'))
def edit(id):
    post = get_post(id)

    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            conn.execute('UPDATE posts SET title = ?, content = ?'
                         ' WHERE id = ?',
                         (title, content, id))
            conn.commit()
            conn.close()
            return redirect(url_for('blog'))

    return render_template('blog/edit.html', post=post)


@app.route('/blog/<int:id>/delete', methods=('POST',))
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
    app.run(host='0.0.0.0', port=5000, debug=True, load_dotenv=False)
