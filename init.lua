wifi.setmode(wifi.STATION)
wifi.sta.config("SSID", "PASSWORD")

dofile('telnet.lc')

tmr.alarm(1, 8000, 0, function() print(wifi.sta.getip()) dofile('milight.lc') end )
