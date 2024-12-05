fx_version "cerulean"
game "gta5"
lua54 "yes"

name "eh_template"
description "This is a description."
version "1.0.0"
author "3RROR#0278"
store "https://store.errorhub.co"
website "https://errorhub.co"

shared_scripts {
    "@ox_lib/init.lua",
    "config/config.lua",
    "shared/**.lua",
}

client_scripts {
    "client/**.lua",
}

server_scripts {
    -- "@oxmysql/lib/MySQL.lua",
    "config/discord.lua", -- If using discord modules.
    "server/**.lua",
}

files {
    "locales/en.json",
    "web/**/**"
}

dependencies {
    "eh_codekit",
    "ox_lib"
}

escrow_ignore {
    "config/**.lua",
    "shared/**.lua",
    "client/**.lua",
    "server/**.lua",
}