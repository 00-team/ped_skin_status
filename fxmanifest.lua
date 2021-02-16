fx_version "cerulean"

game "gta5"

description "Ped Skin Status"

version "1.1.0"

dependency "es_extended"

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server.lua",
}

client_scripts {
    "client.lua",
}