import socket
#from datetime import datetime as dt
#import MySQLdb
 
s = socket.socket()         
 
s.bind(('0.0.0.0', 8090 ))
s.listen(0)                 
#db = MySQLdb.connect('localhost','root','s','distance')
#cursor=db.cursor()
while True:
 
    client, addr = s.accept()
 
    while True:
        content = client.recv(64)
 
        if len(content) ==0:
           break
 
        else:
         
            print(content)
            s1=content
           
 
            #a=[]
            #a.append(content)
            #print(a[0])
            #print(a[1])
           # currentDT = dt.now()
	    #Timestring=(str(currentDT))
            #print(str("distance_sensor")+':'+str(Timestring)+':'+str(content))
            #print(Timestring)
            #sql="INSERT INTO Distance(type,dateTime,macAddres,distance) VALUES('"+str("dstance_sensor")+"','"+str(Timestring)+"','"+str(s1[:17])+"','"+str(s1[17:])+"')"
            #print(sql)
            #cursor.execute(sql)
            #commit your changes in database
            #db.commit()
 
    
    client.close()



