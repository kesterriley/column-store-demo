
For this to work you need to create a SkySQL instance. Or have another storage engine availble to you. 

In the demo folder there is a python config file, you need to update your credentials in that file.

Visit https://web.ais.dk/aisdata/ and download one or more data zip files.

I extract the data and split it in to managable chunks - the smaller the files the quicker they will upload to SkySQL.

```bash
split -l 1000000 aisdk_<FILENAME>.csv split<nn>
```

You can then run the dataload script, assuming your SkySQL instance is available:

```bash
./create_and_load.sh <HOSTNAME> <PORT> <USERNAME> <PASSWORD> <PEM FILE LOCATION>
```

Once your data is loaded, you can check the data and do some SQL counts, averages, maximum etc.

To run the Python Scripts prepare a virtual environment

```
mkdir /tmp/demo
cd /tmp/demo
python3 -m venv demo
pip install mariadb plotly pandas
```
to run the scripts from within the virtual environment:

```
python ~/cloudexpo/demo/test_1.py
python ~/cloudexpo/demo/test_2.py
python ~/cloudexpo/demo/test_3.py
python ~/cloudexpo/demo/test_4.py
```
