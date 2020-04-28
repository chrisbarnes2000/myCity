from flask import Flask, render_template, request, redirect, url_for

# Setup Flask and login
app = Flask(__name__)


@app.route('/')
@app.route('/index')
def start():
    """Show the Start page."""
    return render_template('start_page.html')


@app.route('/load')
def loadgame():
    """Show the load game page."""
    return render_template('load_game.html')


@app.route('/save')
def save():
    """Show the Save Game Page."""
    return render_template('save_game.html')


@app.route('/play')
def gameplay():
    """Show the game play page."""
    return render_template('game.html')


@app.route('/inventory')
def inventory():
    """Show all items via the inventory page."""
    return render_template('inventory.html')


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
