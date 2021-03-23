import sqlite3

connection = sqlite3.connect('database.db')


with open('schema.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

cur.execute("INSERT INTO posts (title, content) VALUES (?, ?)",
            ('First Post', 'Content for the first post')
            )

cur.execute("INSERT INTO posts (title, content) VALUES (?, ?)",
            ('Second Post', 'Content for the second post')
            )

cur.execute("INSERT INTO users (email, password, first_name, last_name) VALUES (?, ?, ?, ?)",
            ('Chris.Barnes.2000@me.com', 'SUPER_COOL_PASS', 'Chris', 'Barnes')
            )

connection.commit()
connection.close()
