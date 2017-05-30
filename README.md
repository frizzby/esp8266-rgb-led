# esp8266-rgb-led
DIY project: remotely control RGB LED strip with iPhone application. Set any color and brightness.

Repository contains LUA code for [NodeMCU firmware](https://github.com/nodemcu/nodemcu-firmware)

You need NodeMCU Version with **floating point** support. Tested with **0.9.6** version. Newer should also work with minor changes.

[iPhone app](https://itunes.apple.com/us/app/limitlessled/id594759938?mt=8) to control the lights

## HW components:
* esp8266 (ESP-201)
* N-channel MOSFETs that can be driven with 3.3V. I used [FQP30N06L](http://s.click.aliexpress.com/e/zBaQjqzRj?af=707237450).
* 12V power supply
* DC-DC switching regulator (12V-3.3V) to power ESP from 12V line. I used [this one](http://s.click.aliexpress.com/e/YfyzVjYvZ?af=707237450).
* [Screw terminal block connectors](http://s.click.aliexpress.com/e/MbyNZjMVb?af=707237450) to attach wires.


## Some basic schematics:
![espled_1](https://cloud.githubusercontent.com/assets/1830878/10335981/dbb442e0-6cfd-11e5-911e-046e6d4a4c46.png)


## DEMO:

<a href="http://www.youtube.com/watch?feature=player_embedded&v=0MH7v-J_NmY" target="_blank"><img src="http://img.youtube.com/vi/0MH7v-J_NmY/0.jpg" alt="DIY ESP8266 Wi-Fi iPhone controlled rgb led strip demo" width="240" height="180" border="10" /></a>

