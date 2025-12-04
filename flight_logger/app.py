from flask import Flask, render_template
import sqlite3, os
app = Flask(__name__)
DB_FILE = os.path.join(os.path.dirname(__file__), "flights.db")
@app.route('/')
def index():
    conn = sqlite3.connect(DB_FILE)
    c = conn.cursor()
    c.execute("SELECT * FROM flights ORDER BY last_seen DESC LIMIT 200")
    flights = c.fetchall(); conn.close()
    return render_template('log.html', flights=flights, count=len(flights))
if __name__ == '__main__': app.run(host='0.0.0.0', port=5000)
