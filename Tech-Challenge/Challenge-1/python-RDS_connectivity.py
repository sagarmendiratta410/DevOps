import json
import mysql.connector
from mysql.connector import Error
import botocore
import botocore.session
from aws_secretsmanager_caching import SecretCache, SecretCacheConfig

client = botocore.session.get_session().create_client('secretsmanager')
cache_config = SecretCacheConfig()
cache = SecretCache( config = cache_config, client = client)

secret = cache.get_secret_string('Masteraccoundb2')

print(type(secret))
y1 = json.loads(secret)
y1["password"]


try:
    connection = mysql.connector.connect(host='terraform-20220709194449956000000001.cgph34pcibdl.us-east-1.rds.amazonaws.com',
                                         database='mydb',
                                         user='user1',
                                         password= y1["password"])
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)


except Error as e:
    print("Error while connecting to MySQL", e)
