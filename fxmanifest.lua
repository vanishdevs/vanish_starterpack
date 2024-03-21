fx_version 'adamant'
game 'gta5'
author 'vanishdev'
lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua',
  'config.lua'
}
client_script 'client.lua'
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/*.lua'
}

files {
  'locales/*.json'
}
