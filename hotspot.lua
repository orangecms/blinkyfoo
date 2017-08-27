-----------------------------------------------------
------------------- WIFI/DHCP -----------------------
-----------------------------------------------------

-- SSID, password, and authentication method
cfg = {}
cfg.ssid = "blinkyfoo"
cfg.pwd  = "blinkyfoo"
cfg.auth = wifi.WPA2_PSK
-- AP mode with station support, true for saving
wifi.setmode(wifi.STATIONAP, true)
wifi.ap.config(cfg)
wifi.ap.dhcp.start()
