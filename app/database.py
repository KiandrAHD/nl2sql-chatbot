
import sqlite3
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
SQL_FILE = BASE_DIR / "data" / "database.sql"
DB_FILE = BASE_DIR / "data" / "sekolah.db"


def init_db() -> None:
    """Buat database SQLite dari file SQL."""
    if not SQL_FILE.exists():
        raise FileNotFoundError(f"File SQL tidak ditemukan: {SQL_FILE}")

    if DB_FILE.exists():
        DB_FILE.unlink()

    script = SQL_FILE.read_text(encoding="utf-8")

    conn = sqlite3.connect(DB_FILE)

    try:
        conn.executescript(script)
        conn.commit()
    finally:
        conn.close()

    print(f"Database berhasil dibuat: {DB_FILE}")


if __name__ == "__main__":
    init_db()
