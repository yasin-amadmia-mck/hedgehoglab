from flask import Flask, request, redirect, url_for
from flask_cors import CORS

import psycopg2


app = Flask(__name__)
CORS(app)

# Connect to the database
conn = psycopg2.connect(database="flask_db", user="postgres",
                        password="root", host="db", port="5432")

# create a cursor
cur = conn.cursor()

# if you already have any table or not id doesnt matter this 
# will create a products table for you.
cur.execute(
    '''CREATE TABLE IF NOT EXISTS products (id serial \
    PRIMARY KEY, name varchar(100), price float);''')

# Insert some data into the table
cur.execute(
    '''INSERT INTO products (name, price) VALUES \
    ('Apple', 1.99), ('Orange', 0.99), ('Banana', 0.59);''')

# commit the changes
conn.commit()

# close the cursor and connection
cur.close()
conn.close()


@app.route('/')
def index():
    conn = psycopg2.connect(database="flask_db",
                            user="postgres",
                            password="root",
                            host="db", port="5432")
    
    cur = conn.cursor()
    cur.execute('''SELECT * FROM products''')
    data = cur.fetchall()
    
    cur.close()
    conn.close()

    json_data = []

    for item in data:
        json_data.append({"id": item[0], "name": item[1], "price": item[2]})

    print(json_data)
    return (json_data)

@app.route('/create', methods=["POST", "PUT"])
def update_table():
    conn = psycopg2.connect(database="flask_db",
                            user="postgres",
                            password="root",
                            host="db", port="5432")
    name = request.json['name']
    price = request.json['price']

    print(name)
    print(price)

    cur = conn.cursor()
    # Insert the data into the table
    cur.execute(
        '''INSERT INTO products \
        (name, price) VALUES (%s, %s)''',
        (name, price))
    
    conn.commit()

    cur.close()
    conn.close()
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)