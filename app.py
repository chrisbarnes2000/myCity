from flask import Flask, render_template, request, redirect, url_for

# Setup Flask and login
app = Flask(__name__)


@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('404.html'), 404


@app.errorhandler(404)
def internal_server_issue_page(e):
    # note that we set the 500 status explicitly
    return render_template('500.html'), 500


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


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True, load_dotenv=False)
