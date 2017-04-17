brew update
brew install lua
echo 'rocks_servers = { "http://rocks.moonscript.org" }' >> /usr/local/etc/luarocks52/config-4.2.lua

luarocks install mjolnir.application
luarocks install mjolnir.hotkey
luarocks install mjolnir.bg.grid
