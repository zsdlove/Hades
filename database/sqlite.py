#!/usr/bin/python
import sqlite3

def createTable():
	conn = sqlite3.connect('res/result.db')
	print("Opened database successfully")
	c = conn.cursor()
	c.execute('''CREATE TABLE resultInfo
	       (ID INTEGER PRIMARY KEY AUTOINCREMENT,
	       LC              TEXT    NOT NULL,
	       SINK            TEXT    NOT NULL,
	       SOURCE          TEXT    NOT NULL,
	       SINKBELONGTO    TEXT,
	       SOURCEBELONGTO  TEXT);''')
	print("Table created successfully")
	conn.commit()
	conn.close()

def insert(LC,SINK,SOURCE,SINKBELONGTO,SOURCEBELONGTO):
	conn = sqlite3.connect('res/result.db')
	c = conn.cursor()
	print("Opened database successfully")
	c.execute("INSERT INTO resultInfo (ID,LC,SINK,SOURCE,SINKBELONGTO,SOURCEBELONGTO) \
	      VALUES (NULL, '%s', '%s', '%s', '%s','%s')"%(LC,SINK,SOURCE,SINKBELONGTO,SOURCEBELONGTO));
	conn.commit()
	print("Records created successfully")
	conn.close()

def check():
	conn = sqlite3.connect('res/result.db')
	c = conn.cursor()
	print("Opened database successfully")
	cursor = c.execute("SELECT ID,LC,SINK,SOURCE,SINKBELONGTO,SOURCEBELONGTO  from resultInfo")
	for row in cursor:
		print("ID = %d"%row[0])
		print("LC = %s"%row[1])
		print("SINK = %s"%row[2])
		print("SOURCE = %s"%row[3])
		print("SINKBELONGTO = %s"%row[4])
		print("SOURCEBELONGTO = %s"%row[5])

	print("Operation done successfully")
	conn.close()

if __name__ == '__main__':
	#createTable()
	insert("TEST","TEST","TEST","TEST","TEST")
	check()
	pass