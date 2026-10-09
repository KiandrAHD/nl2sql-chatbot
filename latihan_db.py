import sqlite3
from pathlib import Path

db_file = Path("data/sekolah.db")

conn = sqlite3.connect(db_file)
cur = conn.cursor()

cur.execute(
    "SELECT name FROM sqlite_master "
    "WHERE type = 'table' ORDER BY name"
)
print("Daftar Tabel: ", cur.fetchall())

cur.execute("SELECT COUNT(*) FROM siswa")
print("Jumlah Siswa: ", cur.fetchone()[0])

cur.execute("SELECT COUNT(*) FROM nilai")
print("Jumlah Nilai: ", cur.fetchone()[0])

conn.close()