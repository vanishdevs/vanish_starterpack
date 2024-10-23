fx_version 'adamant'
game 'gta5'
lua54 'yes'
version '1.0.0'

shared_scripts { '@ox_lib/init.lua', '@es_extended/imports.lua', 'shared/*.lua' }
client_script 'client.lua'
server_scripts { '@oxmysql/lib/MySQL.lua', 'server.lua }
files { 'locales/*.json' }
