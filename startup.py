import subprocess
import threading
import time
import sys

def startdb(dbpath, OS):
	print "Opening database @ %s" %dbpath
	if "linux" in OS:
		subprocess.call(['xterm -e mongod --dbpath '+dbpath], shell=True)
	elif "win" in OS:
		pass 

def startsh(OS):
	print "Starting mongo shell just 4 u"
	if "linux" in OS:
		subprocess.call(['xterm -e mongo'], shell=True)
	elif "win" in OS:
		pass

def startapp(OS):
	print "Starting app"
	if "linux" in OS:
		subprocess.call(['xterm -e npm start &'], shell=True)
	elif "win" in OS:
		pass

def startsentinel(OS):
	print "Starting collecting data"
	if "linux" in OS:
		subprocess.call(['xterm -e node dotaserv.js'], shell=True)
	elif "win" in OS:
		pass

with open("quickdb.conf", 'r') as f:
	OS = sys.platform
	settings = {line.split('=')[0] : line.split('=')[1] for line in f.read().split('\n')} 
	mongoThread = threading.Thread(target=startdb, args =(settings['dbpath'], OS))
	shellThread = threading.Thread(target=startsh, args = [OS])
	appThread = threading.Thread(target=startapp, args = [OS])
	npmThread = threading.Thread(target=startsentinel, args = [OS])
	

	mongoThread.start()
	time.sleep(2)
	shellThread.start()
	time.sleep(0.2)
	appThread.start()
	time.sleep(0.2)
	npmThread.start()

	# mongoThread.join()
