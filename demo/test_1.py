import mariadb

from kesterconfig import *


conn = mariadb.connect(**config)

cur = conn.cursor()

cur.execute("SELECT destination, COUNT(destination) as tot " \
            "FROM tracking " \
            "GROUP BY DESTINATION " \
            "ORDER BY tot DESC LIMIT 20")

results = cur.fetchall()

print("------------------------------------")
print('Destination\t\tTotal')
print("------------------------------------")
for (destination, tot) in results:
    print(f"{destination}\t\t{tot}")
