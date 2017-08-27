-----------------------------------------------------
------------------- BLINKYFOO -----------------------
-----------------------------------------------------

-- GPIO setup
LED  = 3
gpio.mode(LED, gpio.OUTPUT)
gpio.write(LED, gpio.LOW)

-- TCP server setup
port = 1337
server = net.createServer()

function receive(socket, data)
  -- http://lua-users.org/wiki/SwitchStatement
  -- on
  if data == "on\r" or data == "on\n" or data == "on" then
    gpio.write(LED, gpio.HIGH)
  -- off
  elseif data == "off\r" or data == "off\n" or data == "off" then
    gpio.write(LED, gpio.LOW)
  -- default
  elseif data == "bye\r" or data == "bye\n" or data == "bye" then
    socket:close()
  else
    print("message error:", data)
    socket:send("error")
  end
end

if server then
  gpio.write(LED, gpio.HIGH) -- signalize that we are ready to go :)
  server:listen(port, function(connection)
    connection:on("receive", receive)
    connection:send("Hello! I am Blinkyfoo. :)\n")
    connection:send("Send on or off to control the LEDs.\n")
    connection:send("To quit, send bye. Have fun!\n")
  end)
end
