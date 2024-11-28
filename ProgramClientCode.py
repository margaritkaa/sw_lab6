import psycopg2

# Параметри підключення
DB_HOST = "localhost"
DB_PORT = "5455"  
DB_NAME = "grabovskadb"
DB_USER = "postgres"
DB_PASSWORD = "1111"

try:
    # Встановлення з'єднання
    connection = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    cursor = connection.cursor()
    
    # Виконання запиту для отримання списку таблиць
    cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")
    tables = cursor.fetchall()
    
    # Виведення списку таблиць
    print("Таблиці в базі даних:")
    for table in tables:
        print(table[0])
    
except Exception as error:
    print("Помилка підключення до бази даних:", error)
finally:
    # Закриття з'єднання
    if 'connection' in locals() and connection:
        cursor.close()
        connection.close()
        print("З'єднання закрито.")
