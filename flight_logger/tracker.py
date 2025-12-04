import time, json, sqlite3, math, os
from datetime import datetime
JSON_SOURCE = "/run/readsb/aircraft.json"
DB_FILE = os.path.join(os.path.dirname(__file__), "flights.db")
MY_LAT = 31.32; MY_LON = -92.43
def get_distance(lat1, lon1, lat2, lon2):
    R = 6371
    dLat = math.radians(lat2 - lat1); dLon = math.radians(lon2 - lon1)
    a = math.sin(dLat/2)**2 + math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * math.sin(dLon/2)**2
    return (R * (2 * math.atan2(math.sqrt(a), math.sqrt(1-a)))) * 0.621371
def init_db():
    conn = sqlite3.connect(DB_FILE)
    conn.execute('''CREATE TABLE IF NOT EXISTS flights (hex TEXT PRIMARY KEY, flight TEXT, reg TEXT, first_seen TIMESTAMP, last_seen TIMESTAMP, max_alt INT, max_speed INT, max_dist REAL, msg_count INT)''')
    conn.commit(); conn.close()
def update_log():
    try:
        with open(JSON_SOURCE, 'r') as f: data = json.load(f)
    except: return
    conn = sqlite3.connect(DB_FILE); c = conn.cursor(); now = datetime.now()
    for ac in data.get('aircraft', []):
        hex_c = ac.get('hex'); 
        if not hex_c: continue
        flight = ac.get('flight', '').strip(); reg = ac.get('r', '').strip()
        alt = ac.get('alt_baro', 0); speed = ac.get('gs', 0)
        if alt == "ground": alt = 0
        dist = 0.0
        if 'lat' in ac and 'lon' in ac: dist = get_distance(MY_LAT, MY_LON, ac['lat'], ac['lon'])
        c.execute("SELECT * FROM flights WHERE hex=?", (hex_c,))
        row = c.fetchone()
        if row:
            c.execute("UPDATE flights SET last_seen=?, max_alt=MAX(max_alt, ?), max_speed=MAX(max_speed, ?), max_dist=MAX(max_dist, ?), msg_count=msg_count+1, flight=CASE WHEN ? != '' THEN ? ELSE flight END, reg=CASE WHEN ? != '' THEN ? ELSE reg END WHERE hex=?", (now, alt, speed, dist, flight, flight, reg, reg, hex_c))
        else:
            c.execute("INSERT INTO flights VALUES (?,?,?,?,?,?,?,?,?)", (hex_c, flight, reg, now, now, alt, speed, dist, 1))
    conn.commit(); conn.close()
if __name__ == "__main__":
    init_db()
    while True: update_log(); time.sleep(5)
