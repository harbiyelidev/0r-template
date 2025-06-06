fx_version 'cerulean'
game { 'gta5' }
lua54 'yes'

scriptname '0r-template'
version '1.0.0'

author 'vezironi'
description 'A template for creating FiveM scripts with a modular structure.'

shared_scripts {
    '@ox_lib/init.lua',
    'config/*.lua',
    'locales/*.lua',
    'utils/*.lua',
}

client_scripts {
    'client/*.lua',
    'modules/**/client.lua',
}

server_scripts {
    'server/*.lua',
    'modules/**/server.lua',
}

escrow_ignore {
    'shared/*.lua',
    'modules/*.lua',
    'locales/*.lua',
}

files {
    'web/build/*.*',
    'web/build/**/*.*',
}

ui_page 'web/build/index.html'

dependencies {
    'ox_lib',
}