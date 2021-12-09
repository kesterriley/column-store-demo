import mariadb
import plotly.express as px
from pandas import DataFrame

from kesterconfig import *

conn = mariadb.connect(**config)

cur = conn.cursor()

cur.execute("SELECT destination, COUNT(destination) as tot " \
            "FROM tracking " \
            "GROUP BY DESTINATION " \
            "ORDER BY tot DESC LIMIT 20")

results = cur.fetchall()
        
df = DataFrame(results, columns = ['Destination','Total'])
fig = px.line(df, x="Destination", y="Total", title="Most visited locations")
fig.update_xaxes(type='category')
fig.show()
