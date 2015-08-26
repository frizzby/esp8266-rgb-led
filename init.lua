print(wifi.sta.getip())

wifi.setmode(wifi.STATION)

wifi.sta.config("thisislove", "Persik256")

dofile('telnet.lc')

tmr.alarm(1, 8000, 0, function() print(wifi.sta.getip()) dofile('milight.lc') end )
