#Pulseaudio audio stream
https://wiki.archlinux.org/title/PipeWire

Make sure both have the same `cookie` file.
You can find cookie file at `~/.config/pulse/cookie`

Check functionality by `pactl info`

## Server
```
sudo pacman -S pulseaudio pulseaudio-zeroconf pavucontrol

sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon

#Manual load of modules
pactl load-module module-native-protocol-tcp listen=x.x.x.x #IP address of interface it listens on
pactl load-module module-zeroconf-publish

#Modules loaded during pulseaudio startup
echo "load-module module-native-protocol-tcp listen=x.x.x.x" | sudo tee -a /etc/pulse/default.pa 
echo "load-module module-zeroconf-publish" | sudo tee -a /etc/pulse/default.pa 

pulseaudio -k
```

## Client


```
sudo pacman -S pulseaudio pulseaudio-zeroconf pavucontrol

sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon

pactl load-module module-zeroconf-discover

#Modules loaded during pulseaudio startup
echo "pactl load-module module-zeroconf-discover" | sudo tee -a /etc/pulse/default.pa 

pulseaudio -k
`
```
