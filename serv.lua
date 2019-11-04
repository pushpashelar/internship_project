--it's might be working becoz I don't tried out 

	wifi.setmode(wifi.STATIONAP)
	wifi.ap.config({ssid="sam",pwd="211111111hb"}); --set SSID and password in AP    
    print("Server IP Address:",wifi.ap.getip()) --gets ip address,netmask and gateway address in AP mode
	
	--tmr.alarm(1,1000,1,function()
	--	if wifi.sta.getip()==nil then
	--		print("Waiting for IP...")
	--	else
	--		tmr.stop(1)
	--		our_ip =wifi.sta.getip()
	--		print("Your IP is ".. our_ip)
	--		udpSocket=net.createUDPSocket()
	--		udpSocket:listen(3031, our_ip)
	--		udpSocket:on("receive",function(s,data,port,ip)
	--		print(string.format("received '%s' from %s:%d",data,ip,port))
	--		end)
	--		port,ip=udpSocket:getaddr()
	--		print(string.format("UDP socket listening on %s:%d",ip,port))
	--	end
	--end)
	
	tmr.alarm(1,1000,1,function()
		if wifi.sta.getip()==nil then
			print("Waiting for IP...")
		else
			tmr.stop(1)
			our_ip =wifi.sta.getip()
			print("Your IP is ".. our_ip)
			udpSocket=net.createUDPSocket()
			udpSocket:listen(80, function(conn)
			conn:on("receive", function(conn, receivedData) --register call back function for specific events
        		print("Received Data: " .. receivedData)         
    			end) 
			end)
		end
	end)


