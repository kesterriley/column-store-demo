import mariadb
import plotly.express as px
from pandas import DataFrame

from kesterconfig import *

conn = mariadb.connect(**config)

cur = conn.cursor()

cur.execute("SELECT COUNT(*) locationcount, name, latitude, longitude from tracking WHERE MMSI = 246572000 GROUP BY name, latitude, longitude")

results = cur.fetchall()
        
df = DataFrame(results, columns = ['locationcount','name','latitude','longitude'])

fig = px.scatter_mapbox(df, lat="latitude", lon="longitude", hover_name="name", 
                        hover_data=["locationcount"], color_continuous_scale=px.colors.cyclical.IceFire, 
                        color="locationcount", size="locationcount", zoom=3, height=300)
fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})
fig.show()
