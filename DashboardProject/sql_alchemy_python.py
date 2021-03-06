import os
from sqlalchemy import create_engine
import pandas as pd
from sqlalchemy.types import VARCHAR


### In order to connect to any database, we need 5 things:
HOST = 'localhost'
PORT = '5432'
USER = os.getenv('PGUSER')
PASSWORD = os.getenv('PGPASSWORD')
DB = 'northwind'

print(USER)
print(os.environ)


query = """CREATE TABLE newproducts (
    newproduct_id SERIAL PRIMARY KEY,
    productname VARCHAR(100),
    price FLOAT);"""

query2 = """INSERT INTO newproducts (productname, price) 
    VALUES ('Gouda', 5), ('Gorgonzola', 7), ('Mozzarella', 3), ('Cheddar', 4), ('Camembert', '5');"""

query3 = """..."""