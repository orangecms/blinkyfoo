# blinkyfoo
Blinkyfoo scripts for [NodeMCU](http://www.nodemcu.com/index_en.html)

## Putting the scripts on an ESP8266 board running NodeMCU
You can use
[nodemcu-tool](https://nodemcu.readthedocs.io/en/master/en/upload/#nodemcu-tool)
to upload the scripts:
```sh
nodemcu-tool upload blinky.lua
nodemcu-tool upload hotspot.lua
nodemcu-tool upload init.lua
nodemcu-tool reset
```

By uploading the `init.lua` script, the device will automatically run the other
scripts after reset, or when you turn it on again.

When starting, it will put the `D3` pin to `HIGH`. This is where you can wire
up an LED. For now, this is the only pin used; it's straight-forward to extend
the code and use other pins as well. I am doing this in a related project, but
want to keep it rather simple here.

There will be a Wi-fi hotspot with both the SSID and password being `blinkyfoo`.
You can connect to it and then send commands via TCP to the IP address
`192.168.4.1` on port `1337`.

On UNIX-like systems, you can use `nc`. On Android, you can use the app
[TCP Client](https://play.google.com/store/apps/details?id=com.sollae.eztcpclient&hl=en)

Example:
```sh
🐢 nc 192.168.4.1 1337
nc: using stream socket
Hello! I am Blinkyfoo. :)
Send on or off to control the LEDs.
To quit, send bye. Have fun!
off
on
off
bye
```

## Demo
Check out [this video](https://www.youtube.com/watch?v=d1T1iyMFUbg).
